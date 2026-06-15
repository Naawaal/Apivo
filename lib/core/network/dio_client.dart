import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logging/app_logger.dart';

const _defaultTimeout = Duration(seconds: 30);

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

class DioClient {
  DioClient({Dio? dio}) : _dio = dio ?? _createDio();

  final Dio _dio;
  CancelToken? _cancelToken;

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: _defaultTimeout,
        sendTimeout: _defaultTimeout,
        receiveTimeout: _defaultTimeout,
        responseType: ResponseType.plain,
        validateStatus: (_) => true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.debug(
            '--> ${options.method} ${options.uri}',
            tag: 'Network',
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.debug(
            '<-- ${response.statusCode} ${response.requestOptions.uri}',
            tag: 'Network',
          );
          handler.next(response);
        },
        onError: (error, handler) {
          AppLogger.error(
            'Network error: ${error.message}',
            tag: 'Network',
            error: error,
            stackTrace: error.stackTrace,
          );
          handler.next(error);
        },
      ),
    );

    return dio;
  }

  Future<Response<dynamic>> send(RequestOptions options) {
    _cancelToken = CancelToken();
    options.cancelToken = _cancelToken;
    return _dio.fetch(options);
  }

  void cancel() {
    _cancelToken?.cancel('Request cancelled');
  }
}
