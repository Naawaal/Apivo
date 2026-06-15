import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/saved_requests_table.dart';

part 'saved_requests_dao.g.dart';

@DriftAccessor(tables: [SavedRequests])
class SavedRequestsDao extends DatabaseAccessor<AppDatabase>
    with _$SavedRequestsDaoMixin {
  SavedRequestsDao(super.db);

  Stream<List<SavedRequest>> watchAll() {
    return (select(savedRequests)
          ..orderBy([
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Stream<List<SavedRequest>> watchByCollection(String collectionId) {
    return (select(savedRequests)
          ..where((t) => t.collectionId.equals(collectionId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Future<SavedRequest?> getById(String id) {
    return (select(savedRequests)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertRequest(SavedRequestsCompanion entry) {
    return into(savedRequests).insert(entry);
  }

  Future<bool> updateRequest(SavedRequestsCompanion entry) {
    return update(savedRequests).replace(entry);
  }

  Future<int> deleteRequest(String id) {
    return (delete(savedRequests)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteByCollection(String collectionId) {
    return (delete(savedRequests)
          ..where((t) => t.collectionId.equals(collectionId)))
        .go();
  }

  Future<void> updateLastSentAt(String id, DateTime sentAt) {
    return (update(savedRequests)..where((t) => t.id.equals(id))).write(
      SavedRequestsCompanion(
        lastSentAt: Value(sentAt),
        updatedAt: Value(sentAt),
      ),
    );
  }
}
