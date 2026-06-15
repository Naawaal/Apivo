import '../../request_builder/domain/request_body_type.dart';
import '../../request_builder/domain/request_key_value.dart';
import '../../request_builder/presentation/controllers/request_builder_state.dart';
import '../domain/request_history_model.dart';

class HistoryMapper {
  const HistoryMapper();

  RequestBuilderState toBuilderState(RequestHistoryModel history) {
    return RequestBuilderState(
      method: history.method,
      url: history.displayUrl,
      requestTab: RequestBuilderState.initial().requestTab,
      responseTab: RequestBuilderState.initial().responseTab,
      queryParams: [],
      headers: _headersMapToList(history.requestHeaders),
      authType: RequestBuilderState.initial().authType,
      bearerToken: '',
      basicUsername: '',
      basicPassword: '',
      apiKeyName: '',
      apiKeyValue: '',
      apiKeyLocation: 'header',
      bodyType: history.requestBodyType,
      bodyText: history.requestBodyType == RequestBodyType.json ||
              history.requestBodyType == RequestBodyType.text
          ? history.requestBodyText
          : '',
      formDataFields: [],
      urlEncodedFields: [],
      isSending: false,
      savedRequestId: history.savedRequestId,
      isDirty: true,
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
}
