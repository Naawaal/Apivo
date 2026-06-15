import 'package:flutter/material.dart';

import '../../core/design/tokens/app_colors.dart';
import '../../core/design/tokens/app_radius.dart';
import '../../core/design/tokens/app_spacing.dart';

enum AppBadgeVariant { info, success, warning, error, neutral }

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.variant = AppBadgeVariant.neutral,
  });

  final String label;
  final AppBadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final (background, foreground) = switch (variant) {
      AppBadgeVariant.info => isDark
          ? (AppColors.darkInfoContainer, AppColors.darkOnInfoContainer)
          : (AppColors.infoContainer, AppColors.onInfoContainer),
      AppBadgeVariant.success => isDark
          ? (AppColors.darkSuccessContainer, AppColors.darkOnSuccessContainer)
          : (AppColors.successContainer, AppColors.onSuccessContainer),
      AppBadgeVariant.warning => isDark
          ? (AppColors.darkWarningContainer, AppColors.darkOnWarningContainer)
          : (AppColors.warningContainer, AppColors.onWarningContainer),
      AppBadgeVariant.error => isDark
          ? (AppColors.darkErrorContainer, AppColors.darkOnErrorContainer)
          : (AppColors.errorContainer, AppColors.onErrorContainer),
      AppBadgeVariant.neutral => (
          theme.colorScheme.surfaceContainerHighest,
          theme.colorScheme.onSurfaceVariant,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.smRadius,
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
