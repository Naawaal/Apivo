// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_history_dao.dart';

// ignore_for_file: type=lint
mixin _$RequestHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $RequestHistoryTable get requestHistory => attachedDatabase.requestHistory;
  RequestHistoryDaoManager get managers => RequestHistoryDaoManager(this);
}

class RequestHistoryDaoManager {
  final _$RequestHistoryDaoMixin _db;
  RequestHistoryDaoManager(this._db);
  $$RequestHistoryTableTableManager get requestHistory =>
      $$RequestHistoryTableTableManager(
        _db.attachedDatabase,
        _db.requestHistory,
      );
}
