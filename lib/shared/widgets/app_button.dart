import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/design/tokens/app_spacing.dart';
import '../../core/design/theme/theme_extension.dart';

enum AppButtonVariant { primary, secondary, outline, ghost, danger }

enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = switch (size) {
      AppButtonSize.small => AppSizes.buttonHeightSm,
      AppButtonSize.medium => AppSizes.buttonHeightMd,
      AppButtonSize.large => AppSizes.buttonHeightLg,
    };

    final child = isLoading
        ? SizedBox(
            height: AppSizes.iconMd,
            width: AppSizes.iconMd,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: _foregroundColor(context, theme),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: AppSizes.iconMd),
                const SizedBox(width: AppSpacing.sm),
              ],
              Text(label),
            ],
          );

    final button = switch (variant) {
      AppButtonVariant.primary => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(fullWidth ? double.infinity : 0, height),
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
          ),
          child: child,
        ),
      AppButtonVariant.secondary => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(fullWidth ? double.infinity : 0, height),
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            foregroundColor: theme.colorScheme.onSurface,
            elevation: 0,
          ),
          child: child,
        ),
      AppButtonVariant.outline => OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(fullWidth ? double.infinity : 0, height),
            side: BorderSide(color: theme.appBorderColor),
          ),
          child: child,
        ),
      AppButtonVariant.ghost => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size(fullWidth ? double.infinity : 0, height),
          ),
          child: child,
        ),
      AppButtonVariant.danger => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(fullWidth ? double.infinity : 0, height),
            backgroundColor: theme.errorColor,
            foregroundColor: theme.colorScheme.onError,
          ),
          child: child,
        ),
    };

    return button;
  }

  Color _foregroundColor(BuildContext context, ThemeData theme) {
    return switch (variant) {
      AppButtonVariant.primary => theme.colorScheme.onPrimary,
      AppButtonVariant.danger => theme.colorScheme.onError,
      _ => theme.colorScheme.onSurface,
    };
  }
}
