// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_requests_dao.dart';

// ignore_for_file: type=lint
mixin _$SavedRequestsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SavedRequestsTable get savedRequests => attachedDatabase.savedRequests;
  SavedRequestsDaoManager get managers => SavedRequestsDaoManager(this);
}

class SavedRequestsDaoManager {
  final _$SavedRequestsDaoMixin _db;
  SavedRequestsDaoManager(this._db);
  $$SavedRequestsTableTableManager get savedRequests =>
      $$SavedRequestsTableTableManager(_db.attachedDatabase, _db.savedRequests);
}
