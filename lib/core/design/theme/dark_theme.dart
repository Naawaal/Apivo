import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_shadows.dart';
import '../tokens/app_spacing.dart';
import 'color_scheme.dart';
import 'text_theme.dart';
import 'theme_extension.dart';

ThemeData buildDarkTheme() {
  final colorScheme = buildDarkColorScheme();
  final textTheme = buildAppTextTheme(colorScheme);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.darkBackground,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: textTheme.titleLarge,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.darkSurface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.lgRadius,
        side: const BorderSide(color: AppColors.darkBorder),
      ),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurfaceVariant,
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
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdRadius,
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.mdRadius,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.darkTextTertiary,
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
        side: const BorderSide(color: AppColors.darkBorder),
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
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
      backgroundColor: AppColors.darkSurfaceVariant,
      selectedColor: AppColors.primary.withValues(alpha: 0.2),
      labelStyle: textTheme.labelMedium!,
      side: const BorderSide(color: AppColors.darkBorder),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.smRadius),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
      space: 1,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      height: 64,
      backgroundColor: AppColors.darkSurface,
      indicatorColor: AppColors.primary.withValues(alpha: 0.2),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return textTheme.labelMedium?.copyWith(color: AppColors.primaryLight);
        }
        return textTheme.labelMedium;
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.primaryLight);
        }
        return IconThemeData(color: colorScheme.onSurfaceVariant);
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.darkTextSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primaryLight,
      unselectedLabelColor: AppColors.darkTextSecondary,
      indicatorColor: AppColors.primaryLight,
      labelStyle: textTheme.labelLarge,
      unselectedLabelStyle: textTheme.labelLarge,
      dividerColor: AppColors.darkBorder,
    ),
    extensions: [
      AppThemeExtensionData(
        borderColor: AppColors.darkBorder,
        shadows: AppShadows.sm(color: Colors.black),
        successColor: AppColors.success,
        warningColor: AppColors.warning,
        errorColor: AppColors.error,
        infoColor: AppColors.info,
      ),
    ],
  );
}
