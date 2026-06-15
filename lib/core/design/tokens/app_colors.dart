import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF5B5EF7);
  static const Color primaryLight = Color(0xFF7B7EF9);
  static const Color primaryDark = Color(0xFF4548D6);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Light mode
  static const Color lightBackground = Color(0xFFF6F7FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFEEF0F6);
  static const Color lightBorder = Color(0xFFE2E5EE);
  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightTextTertiary = Color(0xFF9CA3AF);

  // Dark mode
  static const Color darkBackground = Color(0xFF0E1016);
  static const Color darkSurface = Color(0xFF161922);
  static const Color darkSurfaceVariant = Color(0xFF1E2230);
  static const Color darkBorder = Color(0xFF2A2F3D);
  static const Color darkTextPrimary = Color(0xFFF3F4F6);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color darkTextTertiary = Color(0xFF6B7280);

  // Semantic
  static const Color success = Color(0xFF22C55E);
  static const Color successContainer = Color(0xFFDCFCE7);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color onSuccessContainer = Color(0xFF166534);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningContainer = Color(0xFFFEF3C7);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color onWarningContainer = Color(0xFF92400E);

  static const Color error = Color(0xFFEF4444);
  static const Color errorContainer = Color(0xFFFEE2E2);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF991B1B);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoContainer = Color(0xFFDBEAFE);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color onInfoContainer = Color(0xFF1E40AF);

  // Dark semantic containers
  static const Color darkSuccessContainer = Color(0xFF14532D);
  static const Color darkOnSuccessContainer = Color(0xFF86EFAC);
  static const Color darkWarningContainer = Color(0xFF78350F);
  static const Color darkOnWarningContainer = Color(0xFFFCD34D);
  static const Color darkErrorContainer = Color(0xFF7F1D1D);
  static const Color darkOnErrorContainer = Color(0xFFFCA5A5);
  static const Color darkInfoContainer = Color(0xFF1E3A5F);
  static const Color darkOnInfoContainer = Color(0xFF93C5FD);

  static const Color lightSchemeSeed = primary;
  static const Color darkSchemeSeed = primaryLight;
}
