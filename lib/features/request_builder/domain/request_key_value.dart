class RequestKeyValue {
  const RequestKeyValue({
    required this.id,
    required this.key,
    required this.value,
    this.enabled = true,
  });

  final String id;
  final String key;
  final String value;
  final bool enabled;

  factory RequestKeyValue.empty() {
    return RequestKeyValue(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      key: '',
      value: '',
    );
  }

  RequestKeyValue copyWith({
    String? id,
    String? key,
    String? value,
    bool? enabled,
  }) {
    return RequestKeyValue(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      enabled: enabled ?? this.enabled,
    );
  }
}
