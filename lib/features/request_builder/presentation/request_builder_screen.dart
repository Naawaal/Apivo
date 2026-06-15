import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_badge.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../../../shared/widgets/app_text_field.dart';

class RequestBuilderScreen extends StatelessWidget {
  const RequestBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: AppStrings.requestBuilderTitle,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => context.pop(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                const AppBadge(label: 'GET', variant: AppBadgeVariant.info),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppTextField(
                    hint: 'https://api.example.com/endpoint',
                    enabled: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.construction_rounded,
                    size: 32,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Coming Soon',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.requestBuilderComingSoon,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
