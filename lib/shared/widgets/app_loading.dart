import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/design/tokens/app_spacing.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.lg),
            Text(
              message ?? AppStrings.loading,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
