enum AuthType {
  none,
  bearerToken,
  basicAuth,
  apiKey,
}

extension AuthTypeX on AuthType {
  String get label => switch (this) {
        AuthType.none => 'None',
        AuthType.bearerToken => 'Bearer Token',
        AuthType.basicAuth => 'Basic Auth',
        AuthType.apiKey => 'API Key',
      };
}
