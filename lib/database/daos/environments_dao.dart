import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/environments_table.dart';

part 'environments_dao.g.dart';

@DriftAccessor(tables: [Environments])
class EnvironmentsDao extends DatabaseAccessor<AppDatabase>
    with _$EnvironmentsDaoMixin {
  EnvironmentsDao(super.db);

  Stream<List<Environment>> watchAll() {
    return (select(environments)
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Stream<Environment?> watchActive() {
    return (select(environments)..where((t) => t.isActive.equals(true)))
        .watchSingleOrNull();
  }

  Future<Environment?> getById(String id) {
    return (select(environments)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<Environment?> getActive() {
    return (select(environments)..where((t) => t.isActive.equals(true)))
        .getSingleOrNull();
  }

  Future<int> insertEnvironment(EnvironmentsCompanion entry) {
    return into(environments).insert(entry);
  }

  Future<bool> updateEnvironment(EnvironmentsCompanion entry) {
    return update(environments).replace(entry);
  }

  Future<int> deleteEnvironment(String id) {
    return (delete(environments)..where((t) => t.id.equals(id))).go();
  }

  Future<void> deactivateAll() {
    return (update(environments)..where((t) => t.isActive.equals(true))).write(
      const EnvironmentsCompanion(isActive: Value(false)),
    );
  }

  Future<void> setActive(String id) async {
    await deactivateAll();
    await (update(environments)..where((t) => t.id.equals(id))).write(
      EnvironmentsCompanion(
        isActive: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
