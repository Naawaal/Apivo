import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/json_serialization_helper.dart';
import '../../../database/app_database.dart';
import '../../../database/database_provider.dart';
import '../../request_builder/domain/api_request_model.dart';
import '../../request_builder/domain/api_response_model.dart';
import '../domain/request_history_model.dart';

const _maxResponseBodyBytes = 500 * 1024;

final requestHistoryRepositoryProvider = Provider<RequestHistoryRepository>((
  ref,
) {
  return RequestHistoryRepository(ref.watch(databaseProvider));
});

class RequestHistoryRepository {
  RequestHistoryRepository(this._db);

  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<RequestHistoryModel>> watchHistory() {
    return _db.requestHistoryDao.watchAll().map(
      (rows) => rows.map(RequestHistoryModel.fromRow).toList(),
    );
  }

  Stream<List<RequestHistoryModel>> watchRecent({int limit = 5}) {
    return _db.requestHistoryDao
        .watchRecent(limit: limit)
        .map((rows) => rows.map(RequestHistoryModel.fromRow).toList());
  }

  Stream<List<RequestHistoryModel>> watchHistoryByRequest(
    String savedRequestId,
  ) {
    return _db.requestHistoryDao
        .watchBySavedRequest(savedRequestId)
        .map((rows) => rows.map(RequestHistoryModel.fromRow).toList());
  }

  Future<RequestHistoryModel?> getHistoryItem(String id) async {
    final row = await _db.requestHistoryDao.getById(id);
    if (row == null) return null;
    return RequestHistoryModel.fromRow(row);
  }

  Future<RequestHistoryModel> addHistory({
    required ApiRequestModel request,
    required ApiResponseModel response,
    String? savedRequestId,
  }) async {
    final id = _uuid.v4();
    final sentAt = DateTime.now();
    var responseBody = response.rawBody;
    var truncated = false;
    final bodyBytes = utf8.encode(responseBody);
    if (bodyBytes.length > _maxResponseBodyBytes) {
      responseBody = utf8.decode(
        bodyBytes.take(_maxResponseBodyBytes).toList(),
      );
      truncated = true;
    }

    final companion = RequestHistoryCompanion.insert(
      id: id,
      savedRequestId: Value(savedRequestId),
      method: request.method.name,
      url: request.url,
      rawUrl: Value(request.rawUrl ?? request.url),
      resolvedUrl: Value(request.fullResolvedUrl ?? request.resolvedUrl ?? request.url),
      environmentId: Value(request.environmentId),
      environmentName: Value(request.environmentName),
      requestHeadersJson: Value(
        JsonSerializationHelper.headersMapToJson(request.headers),
      ),
      requestBodyType: request.bodyType.name,
      requestBodyText: Value(request.body ?? ''),
      statusCode: Value(response.statusCode),
      statusMessage: Value(response.statusMessage),
      responseHeadersJson: Value(
        JsonSerializationHelper.headersMapToJson(response.headers),
      ),
      responseBodyText: Value(responseBody),
      responseBodyTruncated: Value(truncated),
      durationMs: Value(response.durationMs),
      sizeBytes: Value(response.sizeBytes),
      contentType: Value(response.contentType),
      errorMessage: Value(response.errorMessage),
      sentAt: sentAt,
    );

    await _db.requestHistoryDao.insertHistory(companion);

    return RequestHistoryModel(
      id: id,
      savedRequestId: savedRequestId,
      method: request.method,
      url: request.url,
      rawUrl: request.rawUrl ?? request.url,
      resolvedUrl: request.fullResolvedUrl ?? request.resolvedUrl ?? request.url,
      environmentId: request.environmentId,
      environmentName: request.environmentName,
      requestHeaders: request.headers,
      requestBodyType: request.bodyType,
      requestBodyText: request.body ?? '',
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      responseHeaders: response.headers,
      responseBodyText: responseBody,
      responseBodyTruncated: truncated,
      durationMs: response.durationMs,
      sizeBytes: response.sizeBytes,
      contentType: response.contentType,
      errorMessage: response.errorMessage,
      sentAt: sentAt,
    );
  }

  Future<void> deleteHistory(String id) {
    return _db.requestHistoryDao.deleteHistory(id);
  }

  Future<void> clearHistory() {
    return _db.requestHistoryDao.clearAll();
  }
}
