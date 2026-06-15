import 'package:flutter/material.dart';

import '../../../../core/design/tokens/app_radius.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_badge.dart';
import '../../domain/http_method_type.dart';

AppBadgeVariant colorGroupToBadgeVariant(HttpMethodColorGroup group) {
  return switch (group) {
    HttpMethodColorGroup.success => AppBadgeVariant.success,
    HttpMethodColorGroup.info => AppBadgeVariant.info,
    HttpMethodColorGroup.warning => AppBadgeVariant.warning,
    HttpMethodColorGroup.error => AppBadgeVariant.error,
    HttpMethodColorGroup.neutral => AppBadgeVariant.neutral,
    HttpMethodColorGroup.primary => AppBadgeVariant.neutral,
  };
}

class MethodBadge extends StatelessWidget {
  const MethodBadge({
    super.key,
    required this.method,
  });

  final HttpMethodType method;

  @override
  Widget build(BuildContext context) {
    if (method.colorGroup == HttpMethodColorGroup.primary) {
      final theme = Theme.of(context);
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.12),
          borderRadius: AppRadius.smRadius,
        ),
        child: Text(
          method.label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return AppBadge(
      label: method.label,
      variant: colorGroupToBadgeVariant(method.colorGroup),
    );
  }
}

class RequestMethodSelector extends StatelessWidget {
  const RequestMethodSelector({
    super.key,
    required this.method,
    required this.onChanged,
  });

  final HttpMethodType method;
  final ValueChanged<HttpMethodType> onChanged;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<HttpMethodType>(
      initialValue: method,
      onSelected: onChanged,
      offset: const Offset(0, AppSpacing.xl),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MethodBadge(method: method),
            const SizedBox(width: AppSpacing.xs),
            Icon(
              Icons.arrow_drop_down_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
      itemBuilder: (context) => HttpMethodType.values
          .map(
            (m) => PopupMenuItem<HttpMethodType>(
              value: m,
              child: MethodBadge(method: m),
            ),
          )
          .toList(),
    );
  }
}
