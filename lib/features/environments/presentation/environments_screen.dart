import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_chip.dart';
import '../../../shared/widgets/app_scaffold.dart';

const _environments = [
  ('Development', 6, true),
  ('Staging', 8, false),
  ('Production', 10, false),
];

class EnvironmentsScreen extends StatelessWidget {
  const EnvironmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      showAppBar: false,
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Text(
              AppStrings.environmentsTitle,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Manage environment variables',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            ..._environments.map(
              (env) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
                child: AppCard(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.layers_rounded,
                          color: theme.colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(env.$1, style: theme.textTheme.titleSmall),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              '${env.$2} variables',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      if (env.$3)
                        const AppChip(label: 'Active', selected: true)
                      else
                        AppChip(
                          label: 'Inactive',
                          selected: false,
                          onSelected: (_) {},
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
