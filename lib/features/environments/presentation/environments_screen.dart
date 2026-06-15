import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../core/router/route_paths.dart';
import '../../../core/utils/formatters.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_badge.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_chip.dart';
import '../../../shared/widgets/app_empty_state.dart';
import '../../../shared/widgets/app_error_state.dart';
import '../../../shared/widgets/app_loading.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../data/environments_repository.dart';
import '../domain/environment_model.dart';
import 'environments_providers.dart';
import 'widgets/create_environment_dialog.dart';
import 'widgets/edit_environment_dialog.dart';

class EnvironmentsScreen extends ConsumerWidget {
  const EnvironmentsScreen({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    EnvironmentModel environment,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteEnvironmentTitle),
        content: Text(AppStrings.deleteEnvironmentMessage(environment.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref
          .read(environmentsRepositoryProvider)
          .deleteEnvironment(environment.id);
    }
  }

  void _showMenu(
    BuildContext context,
    WidgetRef ref,
    EnvironmentModel environment,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!environment.isActive)
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text(AppStrings.setActiveEnvironment),
                onTap: () async {
                  Navigator.of(context).pop();
                  await ref
                      .read(environmentsRepositoryProvider)
                      .setActiveEnvironment(environment.id);
                },
              ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text(AppStrings.editEnvironment),
              onTap: () async {
                Navigator.of(context).pop();
                await showDialog<bool>(
                  context: context,
                  builder: (_) =>
                      EditEnvironmentDialog(environment: environment),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_outline,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                AppStrings.delete,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _confirmDelete(context, ref, environment);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final environmentsAsync = ref.watch(environmentsProvider);

    return AppScaffold(
      showAppBar: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<bool>(
          context: context,
          builder: (_) => const CreateEnvironmentDialog(),
        ),
        child: const Icon(Icons.add_rounded),
      ),
      body: AdaptivePage(
        child: environmentsAsync.when(
          loading: () => const AppLoading(),
          error: (_, _) => AppErrorState(
            onRetry: () => ref.invalidate(environmentsProvider),
          ),
          data: (environments) {
            if (environments.isEmpty) {
              return AppEmptyState(
                icon: Icons.layers_outlined,
                title: AppStrings.environmentsEmpty,
                message: AppStrings.environmentsEmptyMessage,
                actionLabel: AppStrings.createEnvironment,
                onAction: () => showDialog<bool>(
                  context: context,
                  builder: (_) => const CreateEnvironmentDialog(),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text(
                  AppStrings.environmentsTitle,
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  AppStrings.environmentsSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  AppStrings.environmentCount(environments.length),
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                ...environments.map(
                  (environment) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
                    child: AppCard(
                      onTap: () => context.push(
                        RoutePaths.environmentById(environment.id),
                      ),
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
                                Text(
                                  environment.name,
                                  style: theme.textTheme.titleSmall,
                                ),
                                if (environment.description != null &&
                                    environment.description!.isNotEmpty) ...[
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    environment.description!,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  '${AppStrings.variableCount(environment.variableCount)} · ${Formatters.formatRelativeTime(environment.updatedAt)}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (environment.isActive)
                            const AppChip(
                              label: AppStrings.activeEnvironment,
                              selected: true,
                            )
                          else
                            AppBadge(
                              label: '${environment.variableCount}',
                              variant: AppBadgeVariant.neutral,
                            ),
                          IconButton(
                            icon: const Icon(Icons.more_vert_rounded),
                            onPressed: () =>
                                _showMenu(context, ref, environment),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
