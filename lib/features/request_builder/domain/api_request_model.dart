import 'http_method_type.dart';
import 'request_auth_config.dart';
import 'request_body_type.dart';
import 'request_key_value.dart';

class ApiRequestModel {
  const ApiRequestModel({
    required this.id,
    required this.name,
    required this.method,
    required this.url,
    required this.queryParams,
    required this.headers,
    required this.auth,
    required this.bodyType,
    this.body,
    this.formFields = const [],
    this.urlEncodedFields = const [],
    this.timeoutSeconds = 30,
    required this.createdAt,
    required this.updatedAt,
    this.rawUrl,
    this.resolvedUrl,
    this.fullResolvedUrl,
    this.environmentId,
    this.environmentName,
  });

  final String id;
  final String name;
  final HttpMethodType method;
  final String url;
  final List<RequestKeyValue> queryParams;
  final Map<String, String> headers;
  final RequestAuthConfig auth;
  final RequestBodyType bodyType;
  final String? body;
  final List<RequestKeyValue> formFields;
  final List<RequestKeyValue> urlEncodedFields;
  final int timeoutSeconds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? rawUrl;
  final String? resolvedUrl;
  final String? fullResolvedUrl;
  final String? environmentId;
  final String? environmentName;
}
