import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../database/app_database.dart';
import '../../../database/database_provider.dart';
import '../domain/saved_request_model.dart';

final savedRequestsRepositoryProvider = Provider<SavedRequestsRepository>((ref) {
  return SavedRequestsRepository(ref.watch(databaseProvider));
});

class SavedRequestsRepository {
  SavedRequestsRepository(this._db);

  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<SavedRequestModel>> watchRequests() {
    return _db.savedRequestsDao.watchAll().map(
          (rows) => rows.map(SavedRequestModel.fromRow).toList(),
        );
  }

  Stream<List<SavedRequestModel>> watchRequestsByCollection(String collectionId) {
    return _db.savedRequestsDao.watchByCollection(collectionId).map(
          (rows) => rows.map(SavedRequestModel.fromRow).toList(),
        );
  }

  Future<SavedRequestModel?> getRequestById(String id) async {
    final row = await _db.savedRequestsDao.getById(id);
    if (row == null) return null;
    return SavedRequestModel.fromRow(row);
  }

  Future<SavedRequestModel> saveRequest(SavedRequestModel request) async {
    final id = request.id.isEmpty ? _uuid.v4() : request.id;
    final now = DateTime.now();
    final model = SavedRequestModel(
      id: id,
      collectionId: request.collectionId,
      name: request.name,
      method: request.method,
      url: request.url,
      queryParams: request.queryParams,
      headers: request.headers,
      auth: request.auth,
      bodyType: request.bodyType,
      formDataFields: request.formDataFields,
      urlEncodedFields: request.urlEncodedFields,
      bodyText: request.bodyText,
      timeoutSeconds: request.timeoutSeconds,
      createdAt: request.createdAt,
      updatedAt: now,
      lastSentAt: request.lastSentAt,
      sortOrder: request.sortOrder,
    );
    await _db.savedRequestsDao.insertRequest(model.toCompanion());
    return model;
  }

  Future<void> updateSavedRequest(SavedRequestModel request) async {
    final updated = SavedRequestModel(
      id: request.id,
      collectionId: request.collectionId,
      name: request.name,
      method: request.method,
      url: request.url,
      queryParams: request.queryParams,
      headers: request.headers,
      auth: request.auth,
      bodyType: request.bodyType,
      formDataFields: request.formDataFields,
      urlEncodedFields: request.urlEncodedFields,
      bodyText: request.bodyText,
      timeoutSeconds: request.timeoutSeconds,
      createdAt: request.createdAt,
      updatedAt: DateTime.now(),
      lastSentAt: request.lastSentAt,
      sortOrder: request.sortOrder,
    );
    await _db.savedRequestsDao.updateRequest(updated.toCompanion());
  }

  Future<void> deleteSavedRequest(String id) {
    return _db.savedRequestsDao.deleteRequest(id);
  }

  Future<void> updateLastSentAt(String id, DateTime sentAt) {
    return _db.savedRequestsDao.updateLastSentAt(id, sentAt);
  }
}
