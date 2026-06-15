import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.controller,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.onChanged,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
  });

  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
      onChanged: onChanged,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
