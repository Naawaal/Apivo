import '../../../core/variables/unresolved_variable.dart';
import '../../../core/variables/variable_resolver.dart';
import '../domain/request_key_value.dart';
import '../presentation/controllers/request_builder_state.dart';

class RequestResolutionResult {
  const RequestResolutionResult({
    required this.resolvedState,
    required this.unresolvedVariables,
  });

  final RequestBuilderState resolvedState;
  final List<UnresolvedVariable> unresolvedVariables;

  bool get hasUnresolvedVariables => unresolvedVariables.isNotEmpty;
}

class RequestVariableResolver {
  const RequestVariableResolver();

  RequestResolutionResult resolve(
    RequestBuilderState state,
    Map<String, String> variables,
  ) {
    final unresolved = <UnresolvedVariable>[];
    final seen = <String>{};

    String resolveString(String input) {
      final result = VariableResolver.resolve(input, variables);
      for (final item in result.unresolvedVariables) {
        if (seen.add(item.key)) {
          unresolved.add(item);
        }
      }
      return result.resolvedText;
    }

    List<RequestKeyValue> resolveKeyValues(List<RequestKeyValue> items) {
      return items.map((item) {
        final resolvedKey = resolveString(item.key);
        final resolvedValue = resolveString(item.value);
        return item.copyWith(key: resolvedKey, value: resolvedValue);
      }).toList();
    }

    final resolvedState = state.copyWith(
      url: resolveString(state.url),
      queryParams: resolveKeyValues(state.queryParams),
      headers: resolveKeyValues(state.headers),
      bearerToken: resolveString(state.bearerToken),
      basicUsername: resolveString(state.basicUsername),
      basicPassword: resolveString(state.basicPassword),
      apiKeyName: resolveString(state.apiKeyName),
      apiKeyValue: resolveString(state.apiKeyValue),
      bodyText: resolveString(state.bodyText),
      formDataFields: resolveKeyValues(state.formDataFields),
      urlEncodedFields: resolveKeyValues(state.urlEncodedFields),
      clearErrors: true,
    );

    return RequestResolutionResult(
      resolvedState: resolvedState,
      unresolvedVariables: unresolved,
    );
  }
}

String formatUnresolvedVariablesMessage(List<UnresolvedVariable> variables) {
  if (variables.isEmpty) return '';
  final tokens = variables.map((item) => item.originalToken).join(', ');
  return 'Unresolved variables: $tokens';
}

String buildFullResolvedUrl(RequestBuilderState resolvedState) {
  final parsedUri = Uri.parse(resolvedState.url.trim());
  final baseUrl = parsedUri.replace(queryParameters: {}).toString();
  final urlQueryParams = Map<String, String>.from(parsedUri.queryParameters);
  final tabQueryParams = <String, String>{};
  for (final item in resolvedState.queryParams) {
    if (!item.enabled) continue;
    final key = item.key.trim();
    if (key.isEmpty) continue;
    tabQueryParams[key] = item.value;
  }
  final merged = {...urlQueryParams, ...tabQueryParams};
  if (merged.isEmpty) return baseUrl;
  return Uri.parse(baseUrl).replace(queryParameters: merged).toString();
}
