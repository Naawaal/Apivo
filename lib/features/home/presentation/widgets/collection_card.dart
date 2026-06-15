import 'package:flutter/material.dart';

import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_badge.dart';
import '../../../../shared/widgets/app_card.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.name,
    required this.requestCount,
    this.onTap,
  });

  final String name;
  final int requestCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.folder_rounded,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(name, style: theme.textTheme.titleSmall),
          ),
          AppBadge(
            label: '$requestCount requests',
            variant: AppBadgeVariant.neutral,
          ),
        ],
      ),
    );
  }
}
