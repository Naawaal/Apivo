import 'dart:convert';

abstract final class ResponseSizeCalculator {
  static int calculate(dynamic data) {
    if (data == null) return 0;
    if (data is List<int>) return data.length;
    if (data is String) return utf8.encode(data).length;
    return utf8.encode(data.toString()).length;
  }
}
