import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_shadows.dart';
import '../tokens/app_spacing.dart';
import 'color_scheme.dart';
import 'text_theme.dart';
import 'theme_extension.dart';

ThemeData buildLightTheme() {
  final colorScheme = buildLightColorScheme();
  final textTheme = buildAppTextTheme(colorScheme);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.lightBackground,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: textTheme.titleLarge,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.lightSurface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.lgRadius,
        side: const BorderSide(color: AppColors.lightBorder),
      ),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurfaceVariant,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.mdRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdRadius,
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdRadius,
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdRadius,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.lightTextTertiary,
      ),
      labelStyle: textTheme.labelLarge,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdRadius),
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdRadius),
        side: const BorderSide(color: AppColors.lightBorder),
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        textStyle: textTheme.labelLarge,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: colorScheme.onSurfaceVariant,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightSurfaceVariant,
      selectedColor: AppColors.primary.withValues(alpha: 0.12),
      labelStyle: textTheme.labelMedium!,
      side: const BorderSide(color: AppColors.lightBorder),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.smRadius),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
      space: 1,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      height: 64,
      backgroundColor: AppColors.lightSurface,
      indicatorColor: AppColors.primary.withValues(alpha: 0.12),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return textTheme.labelMedium?.copyWith(color: AppColors.primary);
        }
        return textTheme.labelMedium;
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.primary);
        }
        return IconThemeData(color: colorScheme.onSurfaceVariant);
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightTextSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.lightTextSecondary,
      indicatorColor: AppColors.primary,
      labelStyle: textTheme.labelLarge,
      unselectedLabelStyle: textTheme.labelLarge,
      dividerColor: AppColors.lightBorder,
    ),
    extensions: [
      AppThemeExtensionData(
        borderColor: AppColors.lightBorder,
        shadows: AppShadows.sm(),
        successColor: AppColors.success,
        warningColor: AppColors.warning,
        errorColor: AppColors.error,
        infoColor: AppColors.info,
      ),
    ],
  );
}
