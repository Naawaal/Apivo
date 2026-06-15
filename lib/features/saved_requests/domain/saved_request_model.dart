import 'package:drift/drift.dart';

import '../../../core/utils/json_serialization_helper.dart';
import '../../../database/app_database.dart';
import '../../request_builder/domain/http_method_type.dart';
import '../../request_builder/domain/request_auth_config.dart';
import '../../request_builder/domain/request_body_type.dart';
import '../../request_builder/domain/request_key_value.dart';

class SavedRequestModel {
  const SavedRequestModel({
    required this.id,
    this.collectionId,
    required this.name,
    required this.method,
    required this.url,
    required this.queryParams,
    required this.headers,
    required this.auth,
    required this.bodyType,
    required this.formDataFields,
    required this.urlEncodedFields,
    required this.bodyText,
    required this.timeoutSeconds,
    required this.createdAt,
    required this.updatedAt,
    this.lastSentAt,
    required this.sortOrder,
  });

  final String id;
  final String? collectionId;
  final String name;
  final HttpMethodType method;
  final String url;
  final List<RequestKeyValue> queryParams;
  final Map<String, String> headers;
  final RequestAuthConfig auth;
  final RequestBodyType bodyType;
  final List<RequestKeyValue> formDataFields;
  final List<RequestKeyValue> urlEncodedFields;
  final String bodyText;
  final int timeoutSeconds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastSentAt;
  final int sortOrder;

  factory SavedRequestModel.fromRow(SavedRequest row) {
    final bodyType = RequestBodyType.values.firstWhere(
      (value) => value.name == row.bodyType,
      orElse: () => RequestBodyType.none,
    );
    final bodyFields = JsonSerializationHelper.keyValuesFromJson(row.bodyJson);

    return SavedRequestModel(
      id: row.id,
      collectionId: row.collectionId,
      name: row.name,
      method: HttpMethodType.values.firstWhere(
        (value) => value.name == row.method,
        orElse: () => HttpMethodType.get,
      ),
      url: row.url,
      queryParams: JsonSerializationHelper.keyValuesFromJson(row.queryParamsJson),
      headers: JsonSerializationHelper.headersMapFromJson(row.headersJson),
      auth: JsonSerializationHelper.authFromJson(row.authJson),
      bodyType: bodyType,
      formDataFields: bodyType == RequestBodyType.formData ? bodyFields : [],
      urlEncodedFields:
          bodyType == RequestBodyType.urlEncoded ? bodyFields : [],
      bodyText: row.bodyText,
      timeoutSeconds: row.timeoutSeconds,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      lastSentAt: row.lastSentAt,
      sortOrder: row.sortOrder,
    );
  }

  SavedRequestsCompanion toCompanion() {
    final bodyFields = bodyType == RequestBodyType.formData
        ? formDataFields
        : bodyType == RequestBodyType.urlEncoded
            ? urlEncodedFields
            : <RequestKeyValue>[];

    return SavedRequestsCompanion(
      id: Value(id),
      collectionId: Value(collectionId),
      name: Value(name),
      method: Value(method.name),
      url: Value(url),
      queryParamsJson: Value(JsonSerializationHelper.keyValuesToJson(queryParams)),
      headersJson: Value(JsonSerializationHelper.headersMapToJson(headers)),
      authJson: Value(JsonSerializationHelper.authToJson(auth)),
      bodyType: Value(bodyType.name),
      bodyJson: Value(JsonSerializationHelper.keyValuesToJson(bodyFields)),
      bodyText: Value(bodyText),
      timeoutSeconds: Value(timeoutSeconds),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastSentAt: Value(lastSentAt),
      sortOrder: Value(sortOrder),
    );
  }
}
