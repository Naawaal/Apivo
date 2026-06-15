import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/logging/app_logger.dart';
import '../../../../core/utils/json_formatter.dart';
import '../../../../core/variables/variable_resolver.dart';
import '../../../environments/data/environments_repository.dart';
import '../../../environments/domain/environment_model.dart';
import '../../../environments/presentation/environments_providers.dart';
import '../../../history/data/history_mapper.dart';
import '../../../history/data/request_history_repository.dart';
import '../../../saved_requests/data/saved_request_mapper.dart';
import '../../../saved_requests/data/saved_requests_repository.dart';
import '../../../saved_requests/domain/saved_request_model.dart';
import '../../data/request_mapper.dart';
import '../../data/request_runner.dart';
import '../../domain/api_request_model.dart';
import '../../domain/api_response_model.dart';
import '../../domain/auth_type.dart';
import '../../domain/http_method_type.dart';
import '../../domain/request_body_type.dart';
import '../../domain/request_config_tab.dart';
import '../../domain/request_key_value.dart';
import '../../domain/response_tab.dart';
import 'request_builder_state.dart';

final requestBuilderControllerProvider =
    NotifierProvider.autoDispose<RequestBuilderController, RequestBuilderState>(
  RequestBuilderController.new,
);

class RequestBuilderController extends AutoDisposeNotifier<RequestBuilderState> {
  static const _mapper = SavedRequestMapper();
  static const _historyMapper = HistoryMapper();

  @override
  RequestBuilderState build() => RequestBuilderState.initial();

  void resetToNew() {
    state = RequestBuilderState.initial();
    loadActiveEnvironment();
  }

  void loadActiveEnvironment() {
    final environment = ref.read(activeEnvironmentProvider).valueOrNull;
    state = state.copyWith(
      activeEnvironmentId: environment?.id,
      activeEnvironmentName: environment?.name,
      clearActiveEnvironment: environment == null,
    );
    resolveCurrentUrlPreview();
  }

  void refreshVariables() {
    resolveCurrentUrlPreview();
  }

  void toggleVariablePreview() {
    state = state.copyWith(
      variablePreviewEnabled: !state.variablePreviewEnabled,
    );
  }

  void resolveCurrentUrlPreview() {
    if (!VariableResolver.containsVariables(state.url)) {
      state = state.copyWith(
        clearVariablePreview: true,
        unresolvedVariables: const [],
        clearVariableError: true,
      );
      return;
    }

    final variableMap = _readActiveVariableMap();
    final result = VariableResolver.resolve(state.url, variableMap);
    state = state.copyWith(
      resolvedUrlPreview:
          result.hasUnresolvedVariables ? null : result.resolvedText,
      unresolvedVariables: result.unresolvedVariables,
      clearVariableError: true,
    );
  }

  void clearVariableError() {
    state = state.copyWith(clearVariableError: true);
  }

  Future<void> setActiveEnvironment(String? id) async {
    if (id == null) return;
    await ref.read(environmentsRepositoryProvider).setActiveEnvironment(id);
    loadActiveEnvironment();
  }

  Map<String, String> _readActiveVariableMap() {
    final variables =
        ref.read(activeEnvironmentVariablesProvider).valueOrNull ??
            const <EnvironmentVariableModel>[];
    return ref.read(environmentsRepositoryProvider).buildVariableMap(variables);
  }

  ({Map<String, String> map, String? environmentId, String? environmentName})
      _readSendContext() {
    final environment = ref.read(activeEnvironmentProvider).valueOrNull;
    final variables =
        ref.read(activeEnvironmentVariablesProvider).valueOrNull ??
            const <EnvironmentVariableModel>[];
    return (
      map: ref.read(environmentsRepositoryProvider).buildVariableMap(variables),
      environmentId: environment?.id,
      environmentName: environment?.name,
    );
  }

  Future<void> loadSavedRequest(String id) async {
    try {
      final model =
          await ref.read(savedRequestsRepositoryProvider).getRequestById(id);
      if (model == null) {
        state = state.copyWith(
          requestError: 'Saved request not found.',
        );
        return;
      }
      state = _mapper.toBuilderState(model);
      loadActiveEnvironment();
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to load saved request',
        tag: 'RequestBuilder',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(requestError: 'Could not load saved request.');
    }
  }

  Future<void> loadHistoryItem(String id) async {
    try {
      final item =
          await ref.read(requestHistoryRepositoryProvider).getHistoryItem(id);
      if (item == null) {
        state = state.copyWith(requestError: 'History item not found.');
        return;
      }
      state = _historyMapper.toBuilderState(item);
      loadActiveEnvironment();
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to load history item',
        tag: 'RequestBuilder',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(requestError: 'Could not load history item.');
    }
  }

  Future<bool> saveCurrentRequest({
    required String name,
    String? collectionId,
  }) async {
    state = state.copyWith(isSaving: true, clearSaveError: true);
    try {
      final repo = ref.read(savedRequestsRepositoryProvider);
      final existingId = state.savedRequestId;
      SavedRequestModel saved;

      if (existingId != null) {
        final existing = await repo.getRequestById(existingId);
        saved = _mapper.fromBuilderState(
          state,
          name: name,
          collectionId: collectionId,
          id: existingId,
          createdAt: existing?.createdAt,
        );
        await repo.updateSavedRequest(saved);
      } else {
        saved = await repo.saveRequest(
          _mapper.fromBuilderState(
            state,
            name: name,
            collectionId: collectionId,
          ),
        );
      }

      state = state.copyWith(
        isSaving: false,
        isDirty: false,
        savedRequestId: saved.id,
        requestName: saved.name,
        collectionId: saved.collectionId,
      );
      return true;
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to save request',
        tag: 'RequestBuilder',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(
        isSaving: false,
        saveError: 'Could not save request.',
      );
      return false;
    }
  }

  Future<bool> updateCurrentSavedRequest() async {
    final name = state.requestName;
    if (state.savedRequestId == null || name == null || name.isEmpty) {
      return false;
    }
    return saveCurrentRequest(
      name: name,
      collectionId: state.collectionId,
    );
  }

  void _markDirty() {
    if (!state.isDirty) {
      state = state.copyWith(isDirty: true);
    }
  }

  void setMethod(HttpMethodType method) {
    state = state.copyWith(method: method);
    _markDirty();
  }

  void setUrl(String url) {
    state = state.copyWith(url: url, validationError: null, clearVariableError: true);
    _markDirty();
    resolveCurrentUrlPreview();
  }

  void setRequestTab(RequestConfigTab tab) {
    state = state.copyWith(requestTab: tab);
  }

  void setResponseTab(ResponseTab tab) {
    state = state.copyWith(responseTab: tab);
  }

  void addQueryParam() {
    state = state.copyWith(
      queryParams: [...state.queryParams, RequestKeyValue.empty()],
    );
    _markDirty();
  }

  void removeQueryParam(String id) {
    state = state.copyWith(
      queryParams: state.queryParams.where((item) => item.id != id).toList(),
    );
    _markDirty();
  }

  void updateQueryParam({
    required String id,
    String? key,
    String? value,
    bool? enabled,
  }) {
    state = state.copyWith(
      queryParams: _updateList(state.queryParams, id, key, value, enabled),
    );
    _markDirty();
  }

  void addHeader() {
    state = state.copyWith(
      headers: [...state.headers, RequestKeyValue.empty()],
    );
    _markDirty();
  }

  void removeHeader(String id) {
    state = state.copyWith(
      headers: state.headers.where((item) => item.id != id).toList(),
    );
    _markDirty();
  }

  void updateHeader({
    required String id,
    String? key,
    String? value,
    bool? enabled,
  }) {
    state = state.copyWith(
      headers: _updateList(state.headers, id, key, value, enabled),
    );
    _markDirty();
  }

  void addFormDataField() {
    state = state.copyWith(
      formDataFields: [...state.formDataFields, RequestKeyValue.empty()],
    );
    _markDirty();
  }

  void removeFormDataField(String id) {
    state = state.copyWith(
      formDataFields:
          state.formDataFields.where((item) => item.id != id).toList(),
    );
    _markDirty();
  }

  void updateFormDataField({
    required String id,
    String? key,
    String? value,
    bool? enabled,
  }) {
    state = state.copyWith(
      formDataFields:
          _updateList(state.formDataFields, id, key, value, enabled),
    );
    _markDirty();
  }

  void addUrlEncodedField() {
    state = state.copyWith(
      urlEncodedFields: [...state.urlEncodedFields, RequestKeyValue.empty()],
    );
    _markDirty();
  }

  void removeUrlEncodedField(String id) {
    state = state.copyWith(
      urlEncodedFields:
          state.urlEncodedFields.where((item) => item.id != id).toList(),
    );
    _markDirty();
  }

  void updateUrlEncodedField({
    required String id,
    String? key,
    String? value,
    bool? enabled,
  }) {
    state = state.copyWith(
      urlEncodedFields:
          _updateList(state.urlEncodedFields, id, key, value, enabled),
    );
    _markDirty();
  }

  void setAuthType(AuthType authType) {
    state = state.copyWith(authType: authType);
    _markDirty();
  }

  void setBearerToken(String token) {
    state = state.copyWith(bearerToken: token);
    _markDirty();
  }

  void setBasicAuth({String? username, String? password}) {
    state = state.copyWith(
      basicUsername: username ?? state.basicUsername,
      basicPassword: password ?? state.basicPassword,
    );
    _markDirty();
  }

  void setApiKey({String? name, String? value}) {
    state = state.copyWith(
      apiKeyName: name ?? state.apiKeyName,
      apiKeyValue: value ?? state.apiKeyValue,
    );
    _markDirty();
  }

  void setApiKeyLocation(String location) {
    state = state.copyWith(apiKeyLocation: location);
    _markDirty();
  }

  void setBodyType(RequestBodyType bodyType) {
    state = state.copyWith(bodyType: bodyType, validationError: null);
    _markDirty();
  }

  void setBodyText(String text) {
    state = state.copyWith(bodyText: text, validationError: null);
    _markDirty();
  }

  void clearBody() {
    state = state.copyWith(bodyText: '', validationError: null);
    _markDirty();
  }

  void formatJson() {
    AppLogger.info('Format JSON tapped', tag: 'RequestBuilder');
    final formatted = JsonFormatter.tryFormatJson(state.bodyText);
    if (formatted == null) {
      state = state.copyWith(
        validationError:
            'Invalid JSON body. Please fix the JSON and try again.',
      );
      return;
    }
    state = state.copyWith(bodyText: formatted, validationError: null);
    _markDirty();
  }

  Future<void> sendRequest() async {
    if (state.isSending) return;

    state = state.copyWith(
      isSending: true,
      clearResponse: true,
      clearErrors: true,
    );

    try {
      final context = _readSendContext();
      final mapped = ref.read(requestMapperProvider).fromState(
            state,
            variables: context.map,
            environmentId: context.environmentId,
            environmentName: context.environmentName,
          );
      if (mapped.isFailure) {
        final error = mapped.errorOrNull ?? 'Could not prepare request.';
        final isVariableError = error.startsWith('Unresolved variables:');
        state = state.copyWith(
          isSending: false,
          validationError: isVariableError ? null : error,
          variableError: isVariableError ? error : null,
        );
        return;
      }

      final request = mapped.dataOrNull!;
      AppLogger.info(
        'Sending request: ${request.method.label} ${request.url}',
        tag: 'RequestBuilder',
      );

      final response = await ref.read(requestRunnerProvider).run(request);
      final sentAt = DateTime.now();

      state = state.copyWith(
        isSending: false,
        response: response,
        lastSentAt: sentAt,
        responseTab: ResponseTab.body,
      );

      unawaited(_persistHistory(request, response, sentAt));

      if (response.hasError) {
        AppLogger.warning(
          'Request error: ${response.errorMessage}',
          tag: 'RequestBuilder',
        );
      } else {
        AppLogger.info(
          'Response received: ${response.statusCode} ${response.statusMessage} (${response.durationMs}ms)',
          tag: 'RequestBuilder',
        );
      }
    } catch (error, stackTrace) {
      AppLogger.error(
        'Unexpected send error',
        tag: 'RequestBuilder',
        error: error,
        stackTrace: stackTrace,
      );
      state = state.copyWith(
        isSending: false,
        requestError: 'Could not complete the request.',
      );
    }
  }

  Future<void> _persistHistory(
    ApiRequestModel request,
    ApiResponseModel response,
    DateTime sentAt,
  ) async {
    try {
      await ref.read(requestHistoryRepositoryProvider).addHistory(
            request: request,
            response: response,
            savedRequestId: state.savedRequestId,
          );

      if (state.savedRequestId != null) {
        await ref
            .read(savedRequestsRepositoryProvider)
            .updateLastSentAt(state.savedRequestId!, sentAt);
      }
    } catch (error, stackTrace) {
      AppLogger.warning(
        'Failed to persist request history',
        tag: 'RequestBuilder',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  List<RequestKeyValue> _updateList(
    List<RequestKeyValue> list,
    String id,
    String? key,
    String? value,
    bool? enabled,
  ) {
    return list
        .map(
          (item) => item.id == id
              ? item.copyWith(key: key, value: value, enabled: enabled)
              : item,
        )
        .toList();
  }
}
