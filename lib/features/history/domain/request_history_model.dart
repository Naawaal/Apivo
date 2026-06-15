import '../../../core/utils/formatters.dart';
import '../../../core/utils/json_serialization_helper.dart';
import '../../../database/app_database.dart';
import '../../request_builder/domain/http_method_type.dart';
import '../../request_builder/domain/request_body_type.dart';

class RequestHistoryModel {
  const RequestHistoryModel({
    required this.id,
    this.savedRequestId,
    required this.method,
    required this.url,
    this.rawUrl,
    this.resolvedUrl,
    this.environmentId,
    this.environmentName,
    required this.requestHeaders,
    required this.requestBodyType,
    required this.requestBodyText,
    this.statusCode,
    this.statusMessage,
    required this.responseHeaders,
    required this.responseBodyText,
    required this.responseBodyTruncated,
    required this.durationMs,
    required this.sizeBytes,
    this.contentType,
    this.errorMessage,
    required this.sentAt,
  });

  final String id;
  final String? savedRequestId;
  final HttpMethodType method;
  final String url;
  final String? rawUrl;
  final String? resolvedUrl;
  final String? environmentId;
  final String? environmentName;
  final Map<String, String> requestHeaders;
  final RequestBodyType requestBodyType;
  final String requestBodyText;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, String> responseHeaders;
  final String responseBodyText;
  final bool responseBodyTruncated;
  final int durationMs;
  final int sizeBytes;
  final String? contentType;
  final String? errorMessage;
  final DateTime sentAt;

  String get displayUrl => rawUrl ?? url;

  bool get isFailed =>
      errorMessage != null && errorMessage!.isNotEmpty ||
      (statusCode != null && (statusCode! < 200 || statusCode! >= 300));

  String get formattedSentAt => Formatters.formatRelativeTime(sentAt);

  factory RequestHistoryModel.fromRow(RequestHistoryData row) {
    return RequestHistoryModel(
      id: row.id,
      savedRequestId: row.savedRequestId,
      method: HttpMethodType.values.firstWhere(
        (value) => value.name == row.method,
        orElse: () => HttpMethodType.get,
      ),
      url: row.url,
      rawUrl: row.rawUrl,
      resolvedUrl: row.resolvedUrl,
      environmentId: row.environmentId,
      environmentName: row.environmentName,
      requestHeaders:
          JsonSerializationHelper.headersMapFromJson(row.requestHeadersJson),
      requestBodyType: RequestBodyType.values.firstWhere(
        (value) => value.name == row.requestBodyType,
        orElse: () => RequestBodyType.none,
      ),
      requestBodyText: row.requestBodyText,
      statusCode: row.statusCode,
      statusMessage: row.statusMessage,
      responseHeaders:
          JsonSerializationHelper.headersMapFromJson(row.responseHeadersJson),
      responseBodyText: row.responseBodyText,
      responseBodyTruncated: row.responseBodyTruncated,
      durationMs: row.durationMs,
      sizeBytes: row.sizeBytes,
      contentType: row.contentType,
      errorMessage: row.errorMessage,
      sentAt: row.sentAt,
    );
  }
}
