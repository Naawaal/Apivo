enum RequestBodyType {
  none,
  json,
  text,
  formData,
  urlEncoded,
  binary,
}

extension RequestBodyTypeX on RequestBodyType {
  String get label => switch (this) {
        RequestBodyType.none => 'None',
        RequestBodyType.json => 'JSON',
        RequestBodyType.text => 'Text',
        RequestBodyType.formData => 'Form Data',
        RequestBodyType.urlEncoded => 'URL Encoded',
        RequestBodyType.binary => 'Binary',
      };
}
