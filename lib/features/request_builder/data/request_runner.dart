import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/logging/app_logger.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/request_timer.dart';
import '../../../core/network/response_size_calculator.dart';
import '../../../core/utils/json_formatter.dart';
import '../domain/api_request_model.dart';
import '../domain/api_response_model.dart';
import '../domain/http_method_type.dart';
import '../domain/request_body_type.dart';
import '../domain/request_key_value.dart';

final requestRunnerProvider = Provider<RequestRunner>((ref) {
  return RequestRunner(ref.watch(dioClientProvider));
});

class RequestRunner {
  const RequestRunner(this._dioClient);

  final DioClient _dioClient;

  Future<ApiResponseModel> run(ApiRequestModel request) async {
    final timer = RequestTimer()..start();

    try {
      final options = _buildRequestOptions(request);
      final response = await _dioClient.send(options);
      timer.stop();

      return _mapSuccess(response, timer);
    } on DioException catch (error, stackTrace) {
      timer.stop();
      AppLogger.error(
        'Request failed: ${error.message}',
        tag: 'Network',
        error: error,
        stackTrace: stackTrace,
      );
      return _mapDioError(error, timer);
    } catch (error, stackTrace) {
      timer.stop();
      AppLogger.error(
        'Unexpected request error',
        tag: 'Network',
        error: error,
        stackTrace: stackTrace,
      );
      return ApiResponseModel(
        errorMessage: 'Could not complete the request.',
        durationMs: timer.durationMs,
        requestStartedAt: timer.startedAt,
        requestEndedAt: timer.endedAt,
      );
    }
  }

  RequestOptions _buildRequestOptions(ApiRequestModel request) {
    final uri = Uri.parse(request.url);
    final queryMap = {
      for (final param in request.queryParams)
        if (param.key.isNotEmpty) param.key: param.value,
    };

    final headers = Map<String, String>.from(request.headers);
    final data = _buildBody(request, headers);

    return RequestOptions(
      method: request.method.label,
      baseUrl: '${uri.scheme}://${uri.host}${uri.hasPort ? ':${uri.port}' : ''}',
      path: uri.path.isEmpty ? '/' : uri.path,
      queryParameters: queryMap.isEmpty ? null : queryMap,
      headers: headers,
      data: data,
      connectTimeout: Duration(seconds: request.timeoutSeconds),
      sendTimeout: Duration(seconds: request.timeoutSeconds),
      receiveTimeout: Duration(seconds: request.timeoutSeconds),
      responseType: ResponseType.plain,
      validateStatus: (_) => true,
    );
  }

  dynamic _buildBody(ApiRequestModel request, Map<String, String> headers) {
    if (_methodsWithoutBody(request.method)) {
      return null;
    }

    switch (request.bodyType) {
      case RequestBodyType.none:
        return null;
      case RequestBodyType.json:
        _setContentTypeIfMissing(
          headers,
          'application/json',
        );
        return request.body;
      case RequestBodyType.text:
        _setContentTypeIfMissing(headers, 'text/plain');
        return request.body;
      case RequestBodyType.formData:
        _setContentTypeIfMissing(
          headers,
          'multipart/form-data',
        );
        return FormData.fromMap(_enabledMap(request.formFields));
      case RequestBodyType.urlEncoded:
        _setContentTypeIfMissing(
          headers,
          'application/x-www-form-urlencoded',
        );
        return _enabledMap(request.urlEncodedFields);
      case RequestBodyType.binary:
        return null;
    }
  }

  bool _methodsWithoutBody(HttpMethodType method) {
    return method == HttpMethodType.get ||
        method == HttpMethodType.head ||
        method == HttpMethodType.options;
  }

  Map<String, String> _enabledMap(List<RequestKeyValue> fields) {
    final result = <String, String>{};
    for (final field in fields) {
      if (!field.enabled) continue;
      final key = field.key.trim();
      if (key.isEmpty) continue;
      result[key] = field.value;
    }
    return result;
  }

  void _setContentTypeIfMissing(Map<String, String> headers, String value) {
    final hasContentType = headers.keys.any(
      (key) => key.toLowerCase() == 'content-type',
    );
    if (!hasContentType) {
      headers['Content-Type'] = value;
    }
  }

  ApiResponseModel _mapSuccess(Response<dynamic> response, RequestTimer timer) {
    final rawBody = response.data?.toString() ?? '';
    final responseHeaders = _flattenHeaders(response.headers.map);
    final contentType = _headerValue(responseHeaders, 'content-type');
    final formattedBody = JsonFormatter.tryFormatJson(rawBody) ?? rawBody;
    final statusCode = response.statusCode;

    return ApiResponseModel(
      statusCode: statusCode,
      statusMessage: response.statusMessage,
      headers: responseHeaders,
      body: formattedBody,
      rawBody: rawBody,
      durationMs: timer.durationMs,
      sizeBytes: ResponseSizeCalculator.calculate(rawBody),
      contentType: contentType,
      isSuccess: statusCode != null && statusCode >= 200 && statusCode < 300,
      requestStartedAt: timer.startedAt,
      requestEndedAt: timer.endedAt,
    );
  }

  ApiResponseModel _mapDioError(DioException error, RequestTimer timer) {
    final response = error.response;
    if (response != null) {
      return _mapSuccess(response, timer).copyWith(
        errorMessage: null,
        isSuccess: response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300,
      );
    }

    return ApiResponseModel(
      errorMessage: _userMessageForDio(error),
      durationMs: timer.durationMs,
      requestStartedAt: timer.startedAt,
      requestEndedAt: timer.endedAt,
    );
  }

  String _userMessageForDio(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        'Connection timed out. Check your internet or server.',
      DioExceptionType.connectionError =>
        'Could not connect to the server.',
      DioExceptionType.badCertificate =>
        'SSL certificate error. The connection is not secure.',
      DioExceptionType.cancel => 'Request cancelled.',
      _ => 'Could not complete the request.',
    };
  }

  Map<String, String> _flattenHeaders(Map<String, List<String>> headers) {
    return headers.map(
      (key, value) => MapEntry(key, value.join(', ')),
    );
  }

  String? _headerValue(Map<String, String> headers, String name) {
    for (final entry in headers.entries) {
      if (entry.key.toLowerCase() == name) {
        return entry.value;
      }
    }
    return null;
  }
}

extension on ApiResponseModel {
  ApiResponseModel copyWith({
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ApiResponseModel(
      statusCode: statusCode,
      statusMessage: statusMessage,
      headers: headers,
      body: body,
      rawBody: rawBody,
      durationMs: durationMs,
      sizeBytes: sizeBytes,
      contentType: contentType,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      requestStartedAt: requestStartedAt,
      requestEndedAt: requestEndedAt,
    );
  }
}
