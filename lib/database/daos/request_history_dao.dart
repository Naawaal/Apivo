import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/request_history_table.dart';

part 'request_history_dao.g.dart';

@DriftAccessor(tables: [RequestHistory])
class RequestHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$RequestHistoryDaoMixin {
  RequestHistoryDao(super.db);

  Stream<List<RequestHistoryData>> watchAll({int? limit}) {
    final query = select(requestHistory)
      ..orderBy([
        (t) => OrderingTerm(expression: t.sentAt, mode: OrderingMode.desc),
      ]);
    if (limit != null) {
      query.limit(limit);
    }
    return query.watch();
  }

  Stream<List<RequestHistoryData>> watchBySavedRequest(String savedRequestId) {
    return (select(requestHistory)
          ..where((t) => t.savedRequestId.equals(savedRequestId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sentAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Stream<List<RequestHistoryData>> watchRecent({int limit = 5}) {
    return watchAll(limit: limit);
  }

  Future<RequestHistoryData?> getById(String id) {
    return (select(requestHistory)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertHistory(RequestHistoryCompanion entry) {
    return into(requestHistory).insert(entry);
  }

  Future<int> deleteHistory(String id) {
    return (delete(requestHistory)..where((t) => t.id.equals(id))).go();
  }

  Future<int> clearAll() {
    return delete(requestHistory).go();
  }
}
