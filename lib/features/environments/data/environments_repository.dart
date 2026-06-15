import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/logging/app_logger.dart';
import '../../../database/app_database.dart';
import '../../../database/database_provider.dart';
import '../domain/environment_model.dart';

final environmentsRepositoryProvider = Provider<EnvironmentsRepository>((ref) {
  return EnvironmentsRepository(ref.watch(databaseProvider));
});

class EnvironmentsRepository {
  EnvironmentsRepository(this._db);

  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<EnvironmentModel>> watchEnvironments() {
    return _db.environmentsDao.watchAll().asyncMap((rows) async {
      final models = <EnvironmentModel>[];
      for (final row in rows) {
        final count =
            await _db.environmentVariablesDao.countByEnvironment(row.id);
        models.add(EnvironmentModel.fromRow(row, variableCount: count));
      }
      return models;
    });
  }

  Stream<EnvironmentModel?> watchActiveEnvironment() {
    return _db.environmentsDao.watchActive().asyncMap((row) async {
      if (row == null) return null;
      final count =
          await _db.environmentVariablesDao.countByEnvironment(row.id);
      return EnvironmentModel.fromRow(row, variableCount: count);
    });
  }

  Future<EnvironmentModel?> getEnvironmentById(String id) async {
    final row = await _db.environmentsDao.getById(id);
    if (row == null) return null;
    final count = await _db.environmentVariablesDao.countByEnvironment(id);
    return EnvironmentModel.fromRow(row, variableCount: count);
  }

  Future<EnvironmentModel> createEnvironment({
    required String name,
    String? description,
  }) async {
    final now = DateTime.now();
    final id = _uuid.v4();
    final activeExists = await _db.environmentsDao.getActive();
    final shouldActivate = activeExists == null;

    await _db.environmentsDao.insertEnvironment(
      EnvironmentsCompanion.insert(
        id: id,
        name: name,
        description: Value(description),
        isActive: Value(shouldActivate),
        createdAt: now,
        updatedAt: now,
      ),
    );

    return EnvironmentModel.fromRow(
      Environment(
        id: id,
        name: name,
        description: description,
        isActive: shouldActivate,
        createdAt: now,
        updatedAt: now,
        sortOrder: 0,
      ),
    );
  }

  Future<void> updateEnvironment(EnvironmentModel environment) async {
    await _db.environmentsDao.updateEnvironment(
      EnvironmentsCompanion(
        id: Value(environment.id),
        name: Value(environment.name),
        description: Value(environment.description),
        isActive: Value(environment.isActive),
        createdAt: Value(environment.createdAt),
        updatedAt: Value(DateTime.now()),
        sortOrder: Value(environment.sortOrder),
      ),
    );
  }

  Future<void> deleteEnvironment(String id) async {
    await _db.environmentVariablesDao.deleteByEnvironment(id);
    await _db.environmentsDao.deleteEnvironment(id);
  }

  Future<void> setActiveEnvironment(String id) async {
    await _db.environmentsDao.setActive(id);
  }

  Stream<List<EnvironmentVariableModel>> watchVariables(String environmentId) {
    return _db.environmentVariablesDao
        .watchByEnvironment(environmentId)
        .map((rows) => rows.map(EnvironmentVariableModel.fromRow).toList());
  }

  Future<EnvironmentVariableModel> addVariable({
    required String environmentId,
    required String key,
    required String value,
    bool isSecret = false,
    bool isEnabled = true,
  }) async {
    final now = DateTime.now();
    final id = _uuid.v4();
    await _db.environmentVariablesDao.insertVariable(
      EnvironmentVariablesCompanion.insert(
        id: id,
        environmentId: environmentId,
        key: key,
        value: Value(value),
        isSecret: Value(isSecret),
        isEnabled: Value(isEnabled),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await _touchEnvironment(environmentId);
    return EnvironmentVariableModel(
      id: id,
      environmentId: environmentId,
      key: key,
      value: value,
      isSecret: isSecret,
      isEnabled: isEnabled,
      createdAt: now,
      updatedAt: now,
      sortOrder: 0,
    );
  }

  Future<void> updateVariable(EnvironmentVariableModel variable) async {
    await _db.environmentVariablesDao.updateVariable(
      EnvironmentVariablesCompanion(
        id: Value(variable.id),
        environmentId: Value(variable.environmentId),
        key: Value(variable.key),
        value: Value(variable.value),
        isSecret: Value(variable.isSecret),
        isEnabled: Value(variable.isEnabled),
        createdAt: Value(variable.createdAt),
        updatedAt: Value(DateTime.now()),
        sortOrder: Value(variable.sortOrder),
      ),
    );
    await _touchEnvironment(variable.environmentId);
  }

  Future<void> deleteVariable(String id) async {
    final variable = await _db.environmentVariablesDao.getById(id);
    if (variable == null) return;
    await _db.environmentVariablesDao.deleteVariable(id);
    await _touchEnvironment(variable.environmentId);
  }

  Future<void> toggleVariableEnabled(String id, bool enabled) async {
    final variable = await _db.environmentVariablesDao.getById(id);
    if (variable == null) return;
    await _db.environmentVariablesDao.updateVariable(
      EnvironmentVariablesCompanion(
        id: Value(id),
        environmentId: Value(variable.environmentId),
        key: Value(variable.key),
        value: Value(variable.value),
        isSecret: Value(variable.isSecret),
        isEnabled: Value(enabled),
        createdAt: Value(variable.createdAt),
        updatedAt: Value(DateTime.now()),
        sortOrder: Value(variable.sortOrder),
      ),
    );
    await _touchEnvironment(variable.environmentId);
  }

  Future<void> toggleVariableSecret(String id, bool secret) async {
    final variable = await _db.environmentVariablesDao.getById(id);
    if (variable == null) return;
    await _db.environmentVariablesDao.updateVariable(
      EnvironmentVariablesCompanion(
        id: Value(id),
        environmentId: Value(variable.environmentId),
        key: Value(variable.key),
        value: Value(variable.value),
        isSecret: Value(secret),
        isEnabled: Value(variable.isEnabled),
        createdAt: Value(variable.createdAt),
        updatedAt: Value(DateTime.now()),
        sortOrder: Value(variable.sortOrder),
      ),
    );
    await _touchEnvironment(variable.environmentId);
  }

  /// Builds a map of enabled variables; duplicate keys use latest updatedAt.
  Map<String, String> buildVariableMap(List<EnvironmentVariableModel> variables) {
    final map = <String, String>{};
    final sorted = [...variables]..sort((a, b) => a.updatedAt.compareTo(b.updatedAt));

    for (final variable in sorted) {
      if (!variable.isEnabled) continue;
      if (map.containsKey(variable.key)) {
        AppLogger.warning(
          'Duplicate environment variable key "${variable.key}"; using latest value',
          tag: 'Environments',
        );
      }
      map[variable.key] = variable.value;
    }
    return map;
  }

  Future<void> _touchEnvironment(String environmentId) async {
    final env = await _db.environmentsDao.getById(environmentId);
    if (env == null) return;
    await _db.environmentsDao.updateEnvironment(
      EnvironmentsCompanion(
        id: Value(environmentId),
        name: Value(env.name),
        description: Value(env.description),
        isActive: Value(env.isActive),
        createdAt: Value(env.createdAt),
        updatedAt: Value(DateTime.now()),
        sortOrder: Value(env.sortOrder),
      ),
    );
  }
}
