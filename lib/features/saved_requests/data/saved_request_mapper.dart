import '../../request_builder/domain/request_auth_config.dart';
import '../../request_builder/domain/request_key_value.dart';
import '../../request_builder/presentation/controllers/request_builder_state.dart';
import '../domain/saved_request_model.dart';

class SavedRequestMapper {
  const SavedRequestMapper();

  RequestBuilderState toBuilderState(SavedRequestModel model) {
    return RequestBuilderState(
      method: model.method,
      url: model.url,
      requestTab: RequestBuilderState.initial().requestTab,
      responseTab: RequestBuilderState.initial().responseTab,
      queryParams: model.queryParams,
      headers: _headersMapToList(model.headers),
      authType: model.auth.type,
      bearerToken: model.auth.bearerToken,
      basicUsername: model.auth.basicUsername,
      basicPassword: model.auth.basicPassword,
      apiKeyName: model.auth.apiKeyName,
      apiKeyValue: model.auth.apiKeyValue,
      apiKeyLocation: model.auth.apiKeyLocation,
      bodyType: model.bodyType,
      bodyText: model.bodyText,
      formDataFields: model.formDataFields,
      urlEncodedFields: model.urlEncodedFields,
      isSending: false,
      savedRequestId: model.id,
      requestName: model.name,
      collectionId: model.collectionId,
      isDirty: false,
    );
  }

  SavedRequestModel fromBuilderState(
    RequestBuilderState state, {
    required String name,
    String? collectionId,
    String? id,
    DateTime? createdAt,
  }) {
    final now = DateTime.now();
    return SavedRequestModel(
      id: id ?? state.savedRequestId ?? '',
      collectionId: collectionId ?? state.collectionId,
      name: name,
      method: state.method,
      url: state.url,
      queryParams: state.queryParams,
      headers: _headersListToMap(state.headers),
      auth: RequestAuthConfig(
        type: state.authType,
        bearerToken: state.bearerToken,
        basicUsername: state.basicUsername,
        basicPassword: state.basicPassword,
        apiKeyName: state.apiKeyName,
        apiKeyValue: state.apiKeyValue,
        apiKeyLocation: state.apiKeyLocation,
      ),
      bodyType: state.bodyType,
      formDataFields: state.formDataFields,
      urlEncodedFields: state.urlEncodedFields,
      bodyText: state.bodyText,
      timeoutSeconds: 30,
      createdAt: createdAt ?? now,
      updatedAt: now,
      lastSentAt: state.lastSentAt,
      sortOrder: 0,
    );
  }

  List<RequestKeyValue> _headersMapToList(Map<String, String> headers) {
    return headers.entries
        .map(
          (entry) => RequestKeyValue(
            id: entry.key,
            key: entry.key,
            value: entry.value,
          ),
        )
        .toList();
  }

  Map<String, String> _headersListToMap(List<RequestKeyValue> headers) {
    final result = <String, String>{};
    for (final item in headers) {
      if (!item.enabled) continue;
      final key = item.key.trim();
      if (key.isEmpty) continue;
      result[key] = item.value;
    }
    return result;
  }
}
