abstract final class AppStrings {
  // Navigation
  static const String navHome = 'Home';
  static const String navCollections = 'Collections';
  static const String navHistory = 'History';
  static const String navEnvironments = 'Environments';
  static const String navSettings = 'Settings';

  // Home
  static const String homeWelcome = 'Welcome back';
  static const String homeSubtitle = 'Build and test API requests';
  static const String homeQuickUrlHint = 'Enter URL or search requests...';
  static const String homeQuickActions = 'Quick Actions';
  static const String homeRecentRequests = 'Recent Requests';
  static const String homeCollections = 'Collections';
  static const String homeSeeAll = 'See all';

  // Quick actions
  static const String actionNewRequest = 'New Request';
  static const String actionCollections = 'Collections';
  static const String actionHistory = 'History';
  static const String actionEnvironments = 'Environments';

  // Request builder
  static const String requestBuilderTitle = 'Request Builder';
  static const String send = 'Send';
  static const String save = 'Save';
  static const String update = 'Update';
  static const String cancel = 'Cancel';
  static const String create = 'Create';
  static const String delete = 'Delete';
  static const String clear = 'Clear';
  static const String failed = 'Failed';
  static const String saveRequestTitle = 'Save Request';
  static const String requestName = 'Request name';
  static const String requestNameHint = 'My API request';
  static const String collectionLabel = 'Collection';
  static const String noCollection = 'No collection';
  static const String createCollectionInline = 'Create new collection';
  static const String useExistingCollection = 'Use existing collection';
  static const String newCollectionName = 'Collection name';
  static const String newCollectionNameHint = 'Enter collection name';
  static const String requestSaved = 'Request saved successfully';
  static const String requestUpdated = 'Request updated successfully';
  static const String unsavedChanges = 'You have unsaved changes';
  static const String urlPlaceholder =
      'https://jsonplaceholder.typicode.com/posts/1';
  static const String keyPlaceholder = 'Key';
  static const String valuePlaceholder = 'Value';
  static const String addRow = 'Add row';
  static const String keyValueEmpty = 'No rows yet. Add a key-value pair.';
  static const String paramsEmpty = 'No query params. Add a parameter.';
  static const String headersEmpty = 'No headers. Add a header.';
  static const String formDataEmpty = 'No form fields. Add a field.';
  static const String urlEncodedEmpty = 'No fields. Add a URL encoded field.';
  static const String authType = 'Auth Type';
  static const String authNoneMessage = 'This request does not use any authorization.';
  static const String bearerToken = 'Bearer Token';
  static const String bearerTokenHint = 'Enter your bearer token';
  static const String username = 'Username';
  static const String usernameHint = 'Enter username';
  static const String password = 'Password';
  static const String passwordHint = 'Enter password';
  static const String apiKeyName = 'Key';
  static const String apiKeyNameHint = 'e.g. X-API-Key';
  static const String apiKeyValue = 'Value';
  static const String apiKeyValueHint = 'Enter API key value';
  static const String apiKeyAddTo = 'Add to';
  static const String apiKeyAddToHeader = 'Header';
  static const String apiKeyAddToQuery = 'Query Params';
  static const String bodyType = 'Body Type';
  static const String bodyNoneMessage = 'This request does not have a body.';
  static const String jsonBodyHint = '{\n  "key": "value"\n}';
  static const String textBodyHint = 'Enter request body text';
  static const String formatJson = 'Format JSON';
  static const String clearBody = 'Clear body';
  static const String binaryPlaceholderTitle = 'Binary Body';
  static const String binaryPlaceholderMessage =
      'File picker coming soon. Upload support will be added in a future phase.';
  static const String responseTitle = 'Response';
  static const String responseEmptyTitle = 'No response yet';
  static const String responseEmptyMessage =
      'Send a request to view the result.';
  static const String responsePreviewPlaceholder =
      'Preview support will be added later.';
  static const String noResponseBody = 'No response body';
  static const String contentType = 'Content-Type';

  // Collections
  static const String collectionsTitle = 'Collections';
  static const String collectionsEmpty = 'No collections yet';
  static const String collectionsEmptyMessage =
      'Organize your API requests into collections for easy access.';
  static const String createCollection = 'Create collection';
  static const String editCollection = 'Edit collection';
  static const String collectionName = 'Name';
  static const String collectionNameHint = 'Enter collection name';
  static const String collectionDescription = 'Description';
  static const String collectionDescriptionHint = 'Optional description';
  static const String deleteCollectionTitle = 'Delete collection?';
  static String deleteCollectionMessage(String name) =>
      'Delete "$name" and all saved requests in it? This cannot be undone.';
  static const String deleteRequestTitle = 'Delete request?';
  static String deleteRequestMessage(String name) =>
      'Delete "$name"? This cannot be undone.';
  static const String noSavedRequests = 'No saved requests';
  static const String noSavedRequestsMessage =
      'Save requests to this collection from the request builder.';
  static String collectionCount(int count) =>
      count == 1 ? '1 collection' : '$count collections';

  // History
  static const String historyTitle = 'History';
  static const String historyEmpty = 'No request history';
  static const String historyEmptyMessage =
      'Your sent requests will appear here.';
  static const String clearHistory = 'Clear history';
  static const String clearHistoryTitle = 'Clear history?';
  static const String clearHistoryMessage =
      'Remove all request history? This cannot be undone.';
  static String historyCount(int count) =>
      count == 1 ? '1 request' : '$count requests';
  static const String responseTruncatedNote =
      'Response body was truncated to 500 KB for storage.';

  // Environments
  static const String environmentsTitle = 'Environments';
  static const String environmentsSubtitle = 'Manage environment variables';
  static const String environmentsEmpty = 'No environments';
  static const String environmentsEmptyMessage =
      'Create environments to manage variables across requests.';
  static const String createEnvironment = 'Create environment';
  static const String editEnvironment = 'Edit environment';
  static const String environmentName = 'Environment name';
  static const String environmentNameHint = 'e.g. Development';
  static const String environmentDescription = 'Description';
  static const String environmentDescriptionHint = 'Optional description';
  static const String activeEnvironment = 'Active';
  static const String inactiveEnvironment = 'Inactive';
  static const String noEnvironment = 'No Environment';
  static const String setActiveEnvironment = 'Set as active';
  static const String deleteEnvironmentTitle = 'Delete environment?';
  static String deleteEnvironmentMessage(String name) =>
      'Delete "$name" and all its variables? This cannot be undone.';
  static const String addVariable = 'Add variable';
  static const String editVariable = 'Edit variable';
  static const String variableKey = 'Key';
  static const String variableKeyHint = 'e.g. base_url';
  static const String variableValue = 'Value';
  static const String variableValueHint = 'Variable value';
  static const String variableSecret = 'Secret';
  static const String variableEnabled = 'Enabled';
  static const String noVariables = 'No variables';
  static const String noVariablesMessage =
      'Add variables to use in requests with {{variable}} syntax.';
  static const String deleteVariableTitle = 'Delete variable?';
  static String deleteVariableMessage(String key) =>
      'Delete variable "$key"?';
  static String environmentCount(int count) =>
      count == 1 ? '1 environment' : '$count environments';
  static String variableCount(int count) =>
      count == 1 ? '1 variable' : '$count variables';
  static const String availableVariables = 'Available variables';
  static const String variableCopied = 'Copied to clipboard';
  static const String resolvedUrlPreview = 'Resolved';
  static const String missingVariables = 'Missing variables';
  static const String revealSecret = 'Reveal';
  static const String hideSecret = 'Hide';

  // Settings
  static const String settingsTitle = 'Settings';
  static const String settingsAppearance = 'Appearance';
  static const String settingsTheme = 'Theme';
  static const String settingsThemeSystem = 'System default';
  static const String settingsAbout = 'About';
  static const String settingsVersion = 'Version';

  // Common
  static const String retry = 'Retry';
  static const String loading = 'Loading...';
  static const String errorTitle = 'Something went wrong';
  static const String errorMessage = 'An unexpected error occurred.';
}
