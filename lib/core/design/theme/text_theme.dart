import 'package:flutter/material.dart';

import '../tokens/app_typography.dart';

TextTheme buildAppTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: AppTypography.displayLarge(color: colorScheme.onSurface),
    displayMedium: AppTypography.displayMedium(color: colorScheme.onSurface),
    titleLarge: AppTypography.titleLarge(color: colorScheme.onSurface),
    titleMedium: AppTypography.titleMedium(color: colorScheme.onSurface),
    titleSmall: AppTypography.titleSmall(color: colorScheme.onSurface),
    headlineMedium:
        AppTypography.headlineMedium(color: colorScheme.onSurface),
    bodyLarge: AppTypography.bodyLarge(color: colorScheme.onSurface),
    bodyMedium: AppTypography.bodyMedium(color: colorScheme.onSurface),
    bodySmall: AppTypography.bodySmall(color: colorScheme.onSurfaceVariant),
    labelLarge: AppTypography.labelLarge(color: colorScheme.onSurface),
    labelMedium:
        AppTypography.labelMedium(color: colorScheme.onSurfaceVariant),
    labelSmall: AppTypography.labelSmall(color: colorScheme.onSurfaceVariant),
  );
}
