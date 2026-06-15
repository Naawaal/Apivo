import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../core/router/route_paths.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_empty_state.dart';
import '../../../shared/widgets/app_loading.dart';
import '../../../shared/widgets/app_section_header.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../collections/presentation/collections_providers.dart';
import '../../history/presentation/history_providers.dart';
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

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _openHistoryItem(BuildContext context, String id) {
    context.push(RoutePaths.request, extra: id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final recentAsync = ref.watch(recentHistoryProvider);
    final collectionsAsync = ref.watch(collectionsProvider);

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
                  childAspectRatio: 2.0,
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
                height: 140,
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
          recentAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: AppLoading(),
            ),
            error: (_, _) => const SizedBox.shrink(),
            data: (recent) {
              if (recent.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.cardGap),
                  child: AppEmptyState(
                    icon: Icons.history_rounded,
                    title: AppStrings.historyEmpty,
                    message: AppStrings.historyEmptyMessage,
                  ),
                );
              }
              return Column(
                children: recent
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.cardGap,
                        ),
                        child: RecentRequestCard(
                          history: item,
                          onTap: () => _openHistoryItem(context, item.id),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          AppSectionHeader(
            title: AppStrings.homeCollections,
            trailing: TextButton(
              onPressed: () => context.go(RoutePaths.collections),
              child: const Text(AppStrings.homeSeeAll),
            ),
          ),
          collectionsAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: AppLoading(),
            ),
            error: (_, _) => const SizedBox.shrink(),
            data: (collections) {
              final preview = collections.take(3).toList();
              if (preview.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.cardGap),
                  child: AppEmptyState(
                    icon: Icons.folder_open_rounded,
                    title: AppStrings.collectionsEmpty,
                    message: AppStrings.collectionsEmptyMessage,
                  ),
                );
              }
              return Column(
                children: preview
                    .map(
                      (collection) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.cardGap,
                        ),
                        child: CollectionCard(
                          name: collection.name,
                          requestCount: collection.requestCount,
                          onTap: () => context.push(
                            RoutePaths.collectionById(collection.id),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
