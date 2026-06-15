enum ResponseTab {
  body,
  headers,
  raw,
  preview,
}

extension ResponseTabX on ResponseTab {
  String get label => switch (this) {
        ResponseTab.body => 'Body',
        ResponseTab.headers => 'Headers',
        ResponseTab.raw => 'Raw',
        ResponseTab.preview => 'Preview',
      };
}
