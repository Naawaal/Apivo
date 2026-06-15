import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/network_result.dart';
import '../../../core/utils/json_formatter.dart';
import '../../../core/utils/validators.dart';
import '../domain/api_request_model.dart';
import '../domain/auth_type.dart';
import '../domain/request_auth_config.dart';
import '../domain/request_body_type.dart';
import '../domain/request_key_value.dart';
import '../presentation/controllers/request_builder_state.dart';
import 'request_variable_resolver.dart';

final requestMapperProvider = Provider<RequestMapper>((ref) {
  return const RequestMapper();
});

class RequestMapper {
  const RequestMapper();

  NetworkResult<ApiRequestModel> fromState(
    RequestBuilderState state, {
    Map<String, String> variables = const {},
    String? environmentId,
    String? environmentName,
  }) {
    final resolution = const RequestVariableResolver().resolve(state, variables);
    if (resolution.hasUnresolvedVariables) {
      return NetworkFailure(
        formatUnresolvedVariablesMessage(resolution.unresolvedVariables),
      );
    }

    final resolved = resolution.resolvedState;
    final rawUrl = state.url;

    final urlError = Validators.isValidHttpUrl(resolved.url);
    if (urlError != null) {
      return NetworkFailure(urlError);
    }

    if (resolved.bodyType == RequestBodyType.binary) {
      return const NetworkFailure(
        'Binary upload will be supported in a later phase.',
      );
    }

    if (resolved.bodyType == RequestBodyType.json &&
        resolved.bodyText.trim().isNotEmpty) {
      final jsonError = JsonFormatter.validateJson(resolved.bodyText);
      if (jsonError != null) {
        return NetworkFailure(jsonError);
      }
    }

    final parsedUri = Uri.parse(resolved.url.trim());
    final baseUrl = parsedUri.replace(queryParameters: {}).toString();

    final urlQueryParams = Map<String, String>.from(parsedUri.queryParameters);
    final tabQueryParams = _enabledKeyValues(resolved.queryParams);
    final mergedQueryParams = {...urlQueryParams, ...tabQueryParams};

    var headers = _buildHeaders(resolved.headers);

    final auth = RequestAuthConfig(
      type: resolved.authType,
      bearerToken: resolved.bearerToken,
      basicUsername: resolved.basicUsername,
      basicPassword: resolved.basicPassword,
      apiKeyName: resolved.apiKeyName,
      apiKeyValue: resolved.apiKeyValue,
      apiKeyLocation: resolved.apiKeyLocation,
    );

    final authResult = _applyAuth(headers, mergedQueryParams, auth);
    headers = authResult.headers;
    final finalQueryParams = authResult.queryParams;

    final queryParamRows = finalQueryParams.entries
        .map(
          (e) => RequestKeyValue(
            id: e.key,
            key: e.key,
            value: e.value,
          ),
        )
        .toList();

    final fullResolvedUrl = finalQueryParams.isEmpty
        ? baseUrl
        : Uri.parse(baseUrl).replace(queryParameters: finalQueryParams).toString();

    final now = DateTime.now();
    return NetworkSuccess(
      ApiRequestModel(
        id: now.microsecondsSinceEpoch.toString(),
        name: 'Untitled Request',
        method: resolved.method,
        url: baseUrl,
        queryParams: queryParamRows,
        headers: headers,
        auth: auth,
        bodyType: resolved.bodyType,
        body: _resolveBodyString(resolved),
        formFields: resolved.formDataFields,
        urlEncodedFields: resolved.urlEncodedFields,
        createdAt: now,
        updatedAt: now,
        rawUrl: rawUrl,
        resolvedUrl: baseUrl,
        fullResolvedUrl: fullResolvedUrl,
        environmentId: environmentId,
        environmentName: environmentName,
      ),
    );
  }

  Map<String, String> _enabledKeyValues(List<RequestKeyValue> items) {
    final result = <String, String>{};
    for (final item in items) {
      if (!item.enabled) continue;
      final key = item.key.trim();
      if (key.isEmpty) continue;
      result[key] = item.value;
    }
    return result;
  }

  Map<String, String> _buildHeaders(List<RequestKeyValue> items) {
    final result = <String, String>{};
    for (final item in items) {
      if (!item.enabled) continue;
      final key = item.key.trim();
      if (key.isEmpty) continue;
      result[key] = item.value;
    }
    return result;
  }

  _AuthResult _applyAuth(
    Map<String, String> headers,
    Map<String, String> queryParams,
    RequestAuthConfig auth,
  ) {
    final updatedHeaders = Map<String, String>.from(headers);
    final updatedQuery = Map<String, String>.from(queryParams);

    updatedHeaders.removeWhere(
      (key, _) => key.toLowerCase() == 'authorization',
    );

    switch (auth.type) {
      case AuthType.none:
        break;
      case AuthType.bearerToken:
        if (auth.bearerToken.isNotEmpty) {
          updatedHeaders['Authorization'] = 'Bearer ${auth.bearerToken}';
        }
      case AuthType.basicAuth:
        if (auth.basicUsername.isNotEmpty || auth.basicPassword.isNotEmpty) {
          final credentials = base64Encode(
            utf8.encode('${auth.basicUsername}:${auth.basicPassword}'),
          );
          updatedHeaders['Authorization'] = 'Basic $credentials';
        }
      case AuthType.apiKey:
        if (auth.apiKeyName.isNotEmpty && auth.apiKeyValue.isNotEmpty) {
          if (auth.apiKeyLocation == 'query') {
            updatedQuery[auth.apiKeyName] = auth.apiKeyValue;
          } else {
            updatedHeaders[auth.apiKeyName] = auth.apiKeyValue;
          }
        }
    }

    return _AuthResult(
      headers: updatedHeaders,
      queryParams: updatedQuery,
    );
  }

  String? _resolveBodyString(RequestBuilderState state) {
    return switch (state.bodyType) {
      RequestBodyType.none => null,
      RequestBodyType.json || RequestBodyType.text => state.bodyText,
      RequestBodyType.formData || RequestBodyType.urlEncoded => null,
      RequestBodyType.binary => null,
    };
  }
}

class _AuthResult {
  const _AuthResult({
    required this.headers,
    required this.queryParams,
  });

  final Map<String, String> headers;
  final Map<String, String> queryParams;
}
