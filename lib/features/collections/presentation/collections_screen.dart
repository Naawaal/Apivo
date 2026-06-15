import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_badge.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_scaffold.dart';

const _collections = [
  ('User API', 12, 'User management endpoints'),
  ('Payment Service', 8, 'Stripe and billing APIs'),
  ('Internal Tools', 5, 'Admin and monitoring'),
  ('Public API', 20, 'External facing endpoints'),
];

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

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
              AppStrings.collectionsTitle,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${_collections.length} collections',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            ..._collections.map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
                child: AppCard(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.folder_rounded,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.$1, style: theme.textTheme.titleSmall),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              c.$3,
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      AppBadge(
                        label: '${c.$2}',
                        variant: AppBadgeVariant.neutral,
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
