import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';

ColorScheme buildLightColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColors.lightSchemeSeed,
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightTextPrimary,
    error: AppColors.error,
    onError: AppColors.onError,
  ).copyWith(
    surfaceContainerHighest: AppColors.lightSurfaceVariant,
    onSurfaceVariant: AppColors.lightTextSecondary,
    outline: AppColors.lightBorder,
    outlineVariant: AppColors.lightBorder,
    tertiary: AppColors.info,
  );
}

ColorScheme buildDarkColorScheme() {
  return ColorScheme.fromSeed(
    seedColor: AppColors.darkSchemeSeed,
    brightness: Brightness.dark,
    primary: AppColors.primaryLight,
    onPrimary: AppColors.onPrimary,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,
    error: AppColors.error,
    onError: AppColors.onError,
  ).copyWith(
    surfaceContainerHighest: AppColors.darkSurfaceVariant,
    onSurfaceVariant: AppColors.darkTextSecondary,
    outline: AppColors.darkBorder,
    outlineVariant: AppColors.darkBorder,
    tertiary: AppColors.info,
  );
}
