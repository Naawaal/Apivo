abstract final class Validators {
  static String? isNotEmpty(String? value, {String message = 'This field is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? isValidUrl(String? value, {String message = 'Enter a valid URL'}) {
    if (value == null || value.trim().isEmpty) {
      return 'URL is required';
    }
    final uri = Uri.tryParse(value.trim());
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return message;
    }
    return null;
  }

  static String? isValidHttpUrl(
    String? value, {
    String message = 'Invalid URL. Include http:// or https://.',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'URL is required';
    }

    final trimmed = value.trim();
    final uri = Uri.tryParse(trimmed);

    if (uri == null ||
        !uri.hasScheme ||
        !uri.hasAuthority ||
        (uri.scheme != 'http' && uri.scheme != 'https')) {
      return message;
    }

    final host = uri.host;
    if (host.isEmpty) {
      return message;
    }

    return null;
  }

  static String? isValidVariableKey(
    String? value, {
    String message =
        'Key must use letters, numbers, underscore, dot, or dash only.',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Variable key is required';
    }
    final trimmed = value.trim();
    if (trimmed.contains(' ')) {
      return 'Variable key cannot contain spaces';
    }
    final pattern = RegExp(r'^[a-zA-Z0-9_.-]+$');
    if (!pattern.hasMatch(trimmed)) {
      return message;
    }
    return null;
  }
}
