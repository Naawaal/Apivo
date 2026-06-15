import 'auth_type.dart';

class RequestAuthConfig {
  const RequestAuthConfig({
    required this.type,
    this.bearerToken = '',
    this.basicUsername = '',
    this.basicPassword = '',
    this.apiKeyName = '',
    this.apiKeyValue = '',
    this.apiKeyLocation = 'header',
  });

  final AuthType type;
  final String bearerToken;
  final String basicUsername;
  final String basicPassword;
  final String apiKeyName;
  final String apiKeyValue;
  final String apiKeyLocation;

  static const none = RequestAuthConfig(type: AuthType.none);
}
