import '../../../../core/variables/unresolved_variable.dart';
import '../../domain/api_response_model.dart';
import '../../domain/auth_type.dart';
import '../../domain/http_method_type.dart';
import '../../domain/request_body_type.dart';
import '../../domain/request_config_tab.dart';
import '../../domain/request_key_value.dart';
import '../../domain/response_tab.dart';

class RequestBuilderState {
  const RequestBuilderState({
    required this.method,
    required this.url,
    required this.requestTab,
    required this.responseTab,
    required this.queryParams,
    required this.headers,
    required this.authType,
    required this.bearerToken,
    required this.basicUsername,
    required this.basicPassword,
    required this.apiKeyName,
    required this.apiKeyValue,
    required this.apiKeyLocation,
    required this.bodyType,
    required this.bodyText,
    required this.formDataFields,
    required this.urlEncodedFields,
    required this.isSending,
    this.response,
    this.validationError,
    this.requestError,
    this.lastSentAt,
    this.savedRequestId,
    this.requestName,
    this.collectionId,
    this.isDirty = false,
    this.isSaving = false,
    this.saveError,
    this.activeEnvironmentId,
    this.activeEnvironmentName,
    this.unresolvedVariables = const [],
    this.variablePreviewEnabled = true,
    this.resolvedUrlPreview,
    this.variableError,
  });

  factory RequestBuilderState.initial() {
    return const RequestBuilderState(
      method: HttpMethodType.get,
      url: 'https://jsonplaceholder.typicode.com/posts/1',
      requestTab: RequestConfigTab.params,
      responseTab: ResponseTab.body,
      queryParams: [],
      headers: [],
      authType: AuthType.none,
      bearerToken: '',
      basicUsername: '',
      basicPassword: '',
      apiKeyName: '',
      apiKeyValue: '',
      apiKeyLocation: 'header',
      bodyType: RequestBodyType.none,
      bodyText: '',
      formDataFields: [],
      urlEncodedFields: [],
      isSending: false,
    );
  }

  final HttpMethodType method;
  final String url;
  final RequestConfigTab requestTab;
  final ResponseTab responseTab;
  final List<RequestKeyValue> queryParams;
  final List<RequestKeyValue> headers;
  final AuthType authType;
  final String bearerToken;
  final String basicUsername;
  final String basicPassword;
  final String apiKeyName;
  final String apiKeyValue;
  final String apiKeyLocation;
  final RequestBodyType bodyType;
  final String bodyText;
  final List<RequestKeyValue> formDataFields;
  final List<RequestKeyValue> urlEncodedFields;
  final bool isSending;
  final ApiResponseModel? response;
  final String? validationError;
  final String? requestError;
  final DateTime? lastSentAt;
  final String? savedRequestId;
  final String? requestName;
  final String? collectionId;
  final bool isDirty;
  final bool isSaving;
  final String? saveError;
  final String? activeEnvironmentId;
  final String? activeEnvironmentName;
  final List<UnresolvedVariable> unresolvedVariables;
  final bool variablePreviewEnabled;
  final String? resolvedUrlPreview;
  final String? variableError;

  bool get hasResponse => response != null;
  bool get isSaved => savedRequestId != null;
  bool get hasUnresolvedVariables => unresolvedVariables.isNotEmpty;

  RequestBuilderState copyWith({
    HttpMethodType? method,
    String? url,
    RequestConfigTab? requestTab,
    ResponseTab? responseTab,
    List<RequestKeyValue>? queryParams,
    List<RequestKeyValue>? headers,
    AuthType? authType,
    String? bearerToken,
    String? basicUsername,
    String? basicPassword,
    String? apiKeyName,
    String? apiKeyValue,
    String? apiKeyLocation,
    RequestBodyType? bodyType,
    String? bodyText,
    List<RequestKeyValue>? formDataFields,
    List<RequestKeyValue>? urlEncodedFields,
    bool? isSending,
    ApiResponseModel? response,
    String? validationError,
    String? requestError,
    DateTime? lastSentAt,
    String? savedRequestId,
    String? requestName,
    String? collectionId,
    bool? isDirty,
    bool? isSaving,
    String? saveError,
    String? activeEnvironmentId,
    String? activeEnvironmentName,
    List<UnresolvedVariable>? unresolvedVariables,
    bool? variablePreviewEnabled,
    String? resolvedUrlPreview,
    String? variableError,
    bool clearResponse = false,
    bool clearErrors = false,
    bool clearSaveError = false,
    bool clearSavedRequest = false,
    bool clearActiveEnvironment = false,
    bool clearVariablePreview = false,
    bool clearVariableError = false,
  }) {
    return RequestBuilderState(
      method: method ?? this.method,
      url: url ?? this.url,
      requestTab: requestTab ?? this.requestTab,
      responseTab: responseTab ?? this.responseTab,
      queryParams: queryParams ?? this.queryParams,
      headers: headers ?? this.headers,
      authType: authType ?? this.authType,
      bearerToken: bearerToken ?? this.bearerToken,
      basicUsername: basicUsername ?? this.basicUsername,
      basicPassword: basicPassword ?? this.basicPassword,
      apiKeyName: apiKeyName ?? this.apiKeyName,
      apiKeyValue: apiKeyValue ?? this.apiKeyValue,
      apiKeyLocation: apiKeyLocation ?? this.apiKeyLocation,
      bodyType: bodyType ?? this.bodyType,
      bodyText: bodyText ?? this.bodyText,
      formDataFields: formDataFields ?? this.formDataFields,
      urlEncodedFields: urlEncodedFields ?? this.urlEncodedFields,
      isSending: isSending ?? this.isSending,
      response: clearResponse ? null : (response ?? this.response),
      validationError:
          clearErrors ? null : (validationError ?? this.validationError),
      requestError: clearErrors ? null : (requestError ?? this.requestError),
      lastSentAt: lastSentAt ?? this.lastSentAt,
      savedRequestId:
          clearSavedRequest ? null : (savedRequestId ?? this.savedRequestId),
      requestName: clearSavedRequest ? null : (requestName ?? this.requestName),
      collectionId:
          clearSavedRequest ? null : (collectionId ?? this.collectionId),
      isDirty: isDirty ?? this.isDirty,
      isSaving: isSaving ?? this.isSaving,
      saveError: clearSaveError ? null : (saveError ?? this.saveError),
      activeEnvironmentId: clearActiveEnvironment
          ? null
          : (activeEnvironmentId ?? this.activeEnvironmentId),
      activeEnvironmentName: clearActiveEnvironment
          ? null
          : (activeEnvironmentName ?? this.activeEnvironmentName),
      unresolvedVariables:
          unresolvedVariables ?? this.unresolvedVariables,
      variablePreviewEnabled:
          variablePreviewEnabled ?? this.variablePreviewEnabled,
      resolvedUrlPreview: clearVariablePreview
          ? null
          : (resolvedUrlPreview ?? this.resolvedUrlPreview),
      variableError:
          clearVariableError ? null : (variableError ?? this.variableError),
    );
  }
}
