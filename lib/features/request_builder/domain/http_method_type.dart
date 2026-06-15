enum HttpMethodType {
  get,
  post,
  put,
  patch,
  delete,
  head,
  options,
}

enum HttpMethodColorGroup {
  success,
  info,
  warning,
  error,
  neutral,
  primary,
}

extension HttpMethodTypeX on HttpMethodType {
  String get label => name.toUpperCase();

  HttpMethodColorGroup get colorGroup => switch (this) {
        HttpMethodType.get => HttpMethodColorGroup.success,
        HttpMethodType.post => HttpMethodColorGroup.info,
        HttpMethodType.put => HttpMethodColorGroup.warning,
        HttpMethodType.delete => HttpMethodColorGroup.error,
        HttpMethodType.patch => HttpMethodColorGroup.primary,
        HttpMethodType.head || HttpMethodType.options =>
          HttpMethodColorGroup.neutral,
      };
}
