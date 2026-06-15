import 'dart:convert';

import '../../core/logging/app_logger.dart';
import '../../features/request_builder/domain/auth_type.dart';
import '../../features/request_builder/domain/request_auth_config.dart';
import '../../features/request_builder/domain/request_key_value.dart';

abstract final class JsonSerializationHelper {
  static String keyValuesToJson(List<RequestKeyValue> items) {
    return jsonEncode(
      items
          .map(
            (item) => {
              'id': item.id,
              'key': item.key,
              'value': item.value,
              'enabled': item.enabled,
            },
          )
          .toList(),
    );
  }

  static List<RequestKeyValue> keyValuesFromJson(String? json) {
    if (json == null || json.trim().isEmpty) return [];
    try {
      final decoded = jsonDecode(json);
      if (decoded is! List) return [];
      return decoded.map((item) {
        final map = Map<String, dynamic>.from(item as Map);
        return RequestKeyValue(
          id: map['id']?.toString() ?? DateTime.now().microsecondsSinceEpoch.toString(),
          key: map['key']?.toString() ?? '',
          value: map['value']?.toString() ?? '',
          enabled: map['enabled'] as bool? ?? true,
        );
      }).toList();
    } catch (error) {
      AppLogger.warning(
        'Failed to parse key-value JSON',
        tag: 'Serialization',
        error: error,
      );
      return [];
    }
  }

  static String headersMapToJson(Map<String, String> headers) {
    return jsonEncode(headers);
  }

  static Map<String, String> headersMapFromJson(String? json) {
    if (json == null || json.trim().isEmpty) return {};
    try {
      final decoded = jsonDecode(json);
      if (decoded is! Map) return {};
      return decoded.map(
        (key, value) => MapEntry(key.toString(), value.toString()),
      );
    } catch (error) {
      AppLogger.warning(
        'Failed to parse headers JSON',
        tag: 'Serialization',
        error: error,
      );
      return {};
    }
  }

  static String authToJson(RequestAuthConfig auth) {
    return jsonEncode({
      'type': auth.type.name,
      'bearerToken': auth.bearerToken,
      'basicUsername': auth.basicUsername,
      'basicPassword': auth.basicPassword,
      'apiKeyName': auth.apiKeyName,
      'apiKeyValue': auth.apiKeyValue,
      'apiKeyLocation': auth.apiKeyLocation,
    });
  }

  static RequestAuthConfig authFromJson(String? json) {
    if (json == null || json.trim().isEmpty) {
      return RequestAuthConfig.none;
    }
    try {
      final map = Map<String, dynamic>.from(jsonDecode(json) as Map);
      final typeName = map['type']?.toString() ?? AuthType.none.name;
      final type = AuthType.values.firstWhere(
        (value) => value.name == typeName,
        orElse: () => AuthType.none,
      );
      return RequestAuthConfig(
        type: type,
        bearerToken: map['bearerToken']?.toString() ?? '',
        basicUsername: map['basicUsername']?.toString() ?? '',
        basicPassword: map['basicPassword']?.toString() ?? '',
        apiKeyName: map['apiKeyName']?.toString() ?? '',
        apiKeyValue: map['apiKeyValue']?.toString() ?? '',
        apiKeyLocation: map['apiKeyLocation']?.toString() ?? 'header',
      );
    } catch (error) {
      AppLogger.warning(
        'Failed to parse auth JSON',
        tag: 'Serialization',
        error: error,
      );
      return RequestAuthConfig.none;
    }
  }
}
