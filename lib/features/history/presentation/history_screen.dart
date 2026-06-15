import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_badge.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_scaffold.dart';

const _history = [
  ('GET', '/api/users', '2m ago', 200),
  ('POST', '/api/auth/login', '15m ago', 201),
  ('PUT', '/api/users/42', '32m ago', 200),
  ('DELETE', '/api/sessions/abc', '1h ago', 204),
  ('GET', '/api/products', '2h ago', 404),
  ('POST', '/api/webhooks', '3h ago', 500),
];

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  AppBadgeVariant _statusVariant(int code) {
    if (code >= 200 && code < 300) return AppBadgeVariant.success;
    if (code >= 400 && code < 500) return AppBadgeVariant.warning;
    if (code >= 500) return AppBadgeVariant.error;
    return AppBadgeVariant.info;
  }

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
              AppStrings.historyTitle,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${_history.length} requests',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            ..._history.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
                child: AppCard(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      AppBadge(
                        label: item.$1,
                        variant: AppBadgeVariant.info,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.$2,
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              item.$3,
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      AppBadge(
                        label: '${item.$4}',
                        variant: _statusVariant(item.$4),
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
