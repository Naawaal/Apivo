class RequestTimer {
  DateTime? _startedAt;
  DateTime? _endedAt;

  void start() {
    _startedAt = DateTime.now();
    _endedAt = null;
  }

  void stop() {
    _endedAt = DateTime.now();
  }

  int get durationMs {
    if (_startedAt == null) return 0;
    final end = _endedAt ?? DateTime.now();
    return end.difference(_startedAt!).inMilliseconds;
  }

  DateTime? get startedAt => _startedAt;
  DateTime? get endedAt => _endedAt;
}
