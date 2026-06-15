enum NetworkExceptionType {
  timeout,
  connection,
  ssl,
  invalidUrl,
  invalidJson,
  unsupportedBody,
  cancelled,
  unknown,
}

class NetworkException implements Exception {
  const NetworkException({
    required this.type,
    required this.message,
    this.cause,
  });

  final NetworkExceptionType type;
  final String message;
  final Object? cause;

  String get userMessage => message;

  @override
  String toString() => 'NetworkException($type): $message';
}
