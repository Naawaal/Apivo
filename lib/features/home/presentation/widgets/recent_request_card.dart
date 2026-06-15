import 'package:flutter/material.dart';

import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_badge.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../history/domain/request_history_model.dart';
import '../../../request_builder/domain/http_method_type.dart';

class RecentRequestCard extends StatelessWidget {
  const RecentRequestCard({
    super.key,
    required this.history,
    this.onTap,
  });

  final RequestHistoryModel history;
  final VoidCallback? onTap;

  AppBadgeVariant _statusVariant(int? code) {
    if (code == null) return AppBadgeVariant.error;
    if (code >= 200 && code < 300) return AppBadgeVariant.success;
    if (code >= 400 && code < 500) return AppBadgeVariant.warning;
    if (code >= 500) return AppBadgeVariant.error;
    return AppBadgeVariant.info;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          AppBadge(
            label: history.method.label,
            variant: AppBadgeVariant.info,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.displayUrl,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  history.formattedSentAt,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          if (history.statusCode != null)
            AppBadge(
              label: '${history.statusCode}',
              variant: _statusVariant(history.statusCode),
            )
          else
            AppBadge(
              label: 'ERR',
              variant: AppBadgeVariant.error,
            ),
        ],
      ),
    );
  }
}
