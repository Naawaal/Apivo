import 'dart:convert';

abstract final class JsonFormatter {
  static bool isJson(String input) {
    if (input.trim().isEmpty) return false;
    try {
      jsonDecode(input);
      return true;
    } catch (_) {
      return false;
    }
  }

  static String? validateJson(String input) {
    if (input.trim().isEmpty) {
      return 'JSON body cannot be empty.';
    }
    try {
      jsonDecode(input);
      return null;
    } catch (_) {
      return 'Invalid JSON body. Please fix the JSON and try again.';
    }
  }

  static String? tryFormatJson(String input) {
    try {
      final decoded = jsonDecode(input);
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(decoded);
    } catch (_) {
      return null;
    }
  }
}
