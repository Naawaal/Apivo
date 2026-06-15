enum RequestConfigTab {
  params,
  headers,
  auth,
  body,
}

extension RequestConfigTabX on RequestConfigTab {
  String get label => switch (this) {
        RequestConfigTab.params => 'Params',
        RequestConfigTab.headers => 'Headers',
        RequestConfigTab.auth => 'Auth',
        RequestConfigTab.body => 'Body',
      };
}
