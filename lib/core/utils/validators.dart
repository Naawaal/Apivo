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
}
