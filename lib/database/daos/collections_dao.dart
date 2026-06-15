import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/collections_table.dart';
import '../tables/saved_requests_table.dart';

part 'collections_dao.g.dart';

@DriftAccessor(tables: [Collections, SavedRequests])
class CollectionsDao extends DatabaseAccessor<AppDatabase>
    with _$CollectionsDaoMixin {
  CollectionsDao(super.db);

  Stream<List<Collection>> watchAll() {
    return (select(collections)
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Future<Collection?> getById(String id) {
    return (select(collections)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertCollection(CollectionsCompanion entry) {
    return into(collections).insert(entry);
  }

  Future<bool> updateCollection(CollectionsCompanion entry) {
    return update(collections).replace(entry);
  }

  Future<int> deleteCollection(String id) {
    return (delete(collections)..where((t) => t.id.equals(id))).go();
  }

  Future<int> countRequests(String collectionId) async {
    final countExp = savedRequests.id.count();
    final query = selectOnly(savedRequests)
      ..addColumns([countExp])
      ..where(savedRequests.collectionId.equals(collectionId));
    final row = await query.getSingle();
    return row.read(countExp) ?? 0;
  }
}
