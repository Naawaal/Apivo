import 'http_status_group.dart';

class ApiResponseModel {
  const ApiResponseModel({
    this.statusCode,
    this.statusMessage,
    this.headers = const {},
    this.body = '',
    this.rawBody = '',
    this.durationMs = 0,
    this.sizeBytes = 0,
    this.contentType,
    this.isSuccess = false,
    this.errorMessage,
    this.requestStartedAt,
    this.requestEndedAt,
  });

  final int? statusCode;
  final String? statusMessage;
  final Map<String, String> headers;
  final String body;
  final String rawBody;
  final int durationMs;
  final int sizeBytes;
  final String? contentType;
  final bool isSuccess;
  final String? errorMessage;
  final DateTime? requestStartedAt;
  final DateTime? requestEndedAt;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  HttpStatusGroup get statusGroup => statusGroupFromCode(statusCode);

  String get formattedDuration => '$durationMs ms';

  String get formattedSize {
    if (sizeBytes < 1024) return '$sizeBytes B';
    return '${(sizeBytes / 1024).toStringAsFixed(2)} KB';
  }
}
