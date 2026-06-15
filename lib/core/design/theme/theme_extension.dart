import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_shadows.dart';

/// Custom theme extension for semantic colors and shadows.
class AppThemeExtensionData extends ThemeExtension<AppThemeExtensionData> {
  const AppThemeExtensionData({
    required this.borderColor,
    required this.shadows,
    required this.successColor,
    required this.warningColor,
    required this.errorColor,
    required this.infoColor,
  });

  final Color borderColor;
  final List<BoxShadow> shadows;
  final Color successColor;
  final Color warningColor;
  final Color errorColor;
  final Color infoColor;

  @override
  AppThemeExtensionData copyWith({
    Color? borderColor,
    List<BoxShadow>? shadows,
    Color? successColor,
    Color? warningColor,
    Color? errorColor,
    Color? infoColor,
  }) {
    return AppThemeExtensionData(
      borderColor: borderColor ?? this.borderColor,
      shadows: shadows ?? this.shadows,
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      errorColor: errorColor ?? this.errorColor,
      infoColor: infoColor ?? this.infoColor,
    );
  }

  @override
  AppThemeExtensionData lerp(AppThemeExtensionData? other, double t) {
    if (other == null) return this;
    return AppThemeExtensionData(
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      shadows: t < 0.5 ? shadows : other.shadows,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
    );
  }
}

extension AppThemeDataExtensions on ThemeData {
  AppThemeExtensionData get appExtension =>
      extension<AppThemeExtensionData>() ??
      const AppThemeExtensionData(
        borderColor: AppColors.lightBorder,
        shadows: [],
        successColor: AppColors.success,
        warningColor: AppColors.warning,
        errorColor: AppColors.error,
        infoColor: AppColors.info,
      );

  Color get appBorderColor => appExtension.borderColor;
  List<BoxShadow> get appShadows =>
      appExtension.shadows.isNotEmpty ? appExtension.shadows : AppShadows.sm();
  Color get successColor => appExtension.successColor;
  Color get warningColor => appExtension.warningColor;
  Color get errorColor => appExtension.errorColor;
  Color get infoColor => appExtension.infoColor;
}
