import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/environment_variables_table.dart';

part 'environment_variables_dao.g.dart';

@DriftAccessor(tables: [EnvironmentVariables])
class EnvironmentVariablesDao extends DatabaseAccessor<AppDatabase>
    with _$EnvironmentVariablesDaoMixin {
  EnvironmentVariablesDao(super.db);

  Stream<List<EnvironmentVariable>> watchByEnvironment(String environmentId) {
    return (select(environmentVariables)
          ..where((t) => t.environmentId.equals(environmentId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Future<EnvironmentVariable?> getById(String id) {
    return (select(environmentVariables)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertVariable(EnvironmentVariablesCompanion entry) {
    return into(environmentVariables).insert(entry);
  }

  Future<bool> updateVariable(EnvironmentVariablesCompanion entry) {
    return update(environmentVariables).replace(entry);
  }

  Future<int> deleteVariable(String id) {
    return (delete(environmentVariables)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteByEnvironment(String environmentId) {
    return (delete(environmentVariables)
          ..where((t) => t.environmentId.equals(environmentId)))
        .go();
  }

  Future<int> countByEnvironment(String environmentId) async {
    final countExp = environmentVariables.id.count();
    final query = selectOnly(environmentVariables)
      ..addColumns([countExp])
      ..where(environmentVariables.environmentId.equals(environmentId));
    final row = await query.getSingle();
    return row.read(countExp) ?? 0;
  }
}
