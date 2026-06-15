import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../core/router/route_paths.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_section_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import 'widgets/collection_card.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/recent_request_card.dart';

class _QuickAction {
  const _QuickAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
}

const _quickActions = [
  _QuickAction(
    title: AppStrings.actionNewRequest,
    subtitle: 'Create a new API request',
    icon: Icons.add_circle_outline_rounded,
    route: RoutePaths.request,
  ),
  _QuickAction(
    title: AppStrings.actionCollections,
    subtitle: 'Browse your collections',
    icon: Icons.folder_outlined,
    route: RoutePaths.collections,
  ),
  _QuickAction(
    title: AppStrings.actionHistory,
    subtitle: 'View past requests',
    icon: Icons.history_rounded,
    route: RoutePaths.history,
  ),
  _QuickAction(
    title: AppStrings.actionEnvironments,
    subtitle: 'Manage variables',
    icon: Icons.layers_outlined,
    route: RoutePaths.environments,
  ),
];

const _recentRequests = [
  ('GET', 'https://api.example.com/users', '2m ago', 200),
  ('POST', 'https://api.example.com/auth/login', '15m ago', 201),
  ('GET', 'https://api.example.com/products', '1h ago', 404),
];

const _collections = [
  ('User API', 12),
  ('Payment Service', 8),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdaptivePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(
            AppStrings.homeWelcome,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            AppConstants.appName,
            style: theme.textTheme.displayMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            AppConstants.appTagline,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          AppCard(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: AppTextField(
              hint: AppStrings.homeQuickUrlHint,
              prefixIcon: Icons.search_rounded,
              readOnly: true,
              onTap: () => context.push(RoutePaths.request),
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          AppSectionHeader(title: AppStrings.homeQuickActions),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 500;
              if (isWide) {
                return GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: AppSpacing.cardGap,
                  crossAxisSpacing: AppSpacing.cardGap,
                  childAspectRatio: 2.2,
                  children: _quickActions
                      .map(
                        (action) => QuickActionCard(
                          title: action.title,
                          subtitle: action.subtitle,
                          icon: action.icon,
                          onTap: () {
                            if (action.route == RoutePaths.request) {
                              context.push(action.route);
                            } else {
                              context.go(action.route);
                            }
                          },
                        ),
                      )
                      .toList(),
                );
              }
              return SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _quickActions.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(width: AppSpacing.cardGap),
                  itemBuilder: (context, index) {
                    final action = _quickActions[index];
                    return SizedBox(
                      width: 160,
                      child: QuickActionCard(
                        title: action.title,
                        subtitle: action.subtitle,
                        icon: action.icon,
                        onTap: () {
                          if (action.route == RoutePaths.request) {
                            context.push(action.route);
                          } else {
                            context.go(action.route);
                          }
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          AppSectionHeader(
            title: AppStrings.homeRecentRequests,
            trailing: TextButton(
              onPressed: () => context.go(RoutePaths.history),
              child: const Text(AppStrings.homeSeeAll),
            ),
          ),
          ..._recentRequests.map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
              child: RecentRequestCard(
                method: r.$1,
                url: r.$2,
                timeAgo: r.$3,
                statusCode: r.$4,
                onTap: () => context.push(RoutePaths.request),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          AppSectionHeader(
            title: AppStrings.homeCollections,
            trailing: TextButton(
              onPressed: () => context.go(RoutePaths.collections),
              child: const Text(AppStrings.homeSeeAll),
            ),
          ),
          ..._collections.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
              child: CollectionCard(
                name: c.$1,
                requestCount: c.$2,
                onTap: () => context.go(RoutePaths.collections),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
