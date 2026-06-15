import 'package:flutter/material.dart';

import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_badge.dart';
import '../../../../shared/widgets/app_card.dart';

class RecentRequestCard extends StatelessWidget {
  const RecentRequestCard({
    super.key,
    required this.method,
    required this.url,
    required this.timeAgo,
    required this.statusCode,
    this.onTap,
  });

  final String method;
  final String url;
  final String timeAgo;
  final int statusCode;
  final VoidCallback? onTap;

  AppBadgeVariant _statusVariant(int code) {
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
          AppBadge(label: method, variant: AppBadgeVariant.info),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  url,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  timeAgo,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          AppBadge(
            label: '$statusCode',
            variant: _statusVariant(statusCode),
          ),
        ],
      ),
    );
  }
}
