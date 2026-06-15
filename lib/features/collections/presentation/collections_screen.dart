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
import '../../../shared/widgets/app_empty_state.dart';
import '../../../shared/widgets/app_error_state.dart';
import '../../../shared/widgets/app_loading.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../domain/collection_model.dart';
import '../data/collections_repository.dart';
import 'collections_providers.dart';
import 'widgets/create_collection_dialog.dart';
import 'widgets/edit_collection_dialog.dart';

class CollectionsScreen extends ConsumerWidget {
  const CollectionsScreen({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    CollectionModel collection,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteCollectionTitle),
        content: Text(
          AppStrings.deleteCollectionMessage(collection.name),
        ),
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
          .read(collectionsRepositoryProvider)
          .deleteCollection(collection.id);
    }
  }

  void _showCollectionMenu(
    BuildContext context,
    WidgetRef ref,
    CollectionModel collection,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text(AppStrings.editCollection),
              onTap: () async {
                Navigator.of(context).pop();
                await showDialog<bool>(
                  context: context,
                  builder: (_) =>
                      EditCollectionDialog(collection: collection),
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
                _confirmDelete(context, ref, collection);
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
    final collectionsAsync = ref.watch(collectionsProvider);

    return AppScaffold(
      showAppBar: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<bool>(
          context: context,
          builder: (_) => const CreateCollectionDialog(),
        ),
        child: const Icon(Icons.add_rounded),
      ),
      body: AdaptivePage(
        child: collectionsAsync.when(
          loading: () => const AppLoading(),
          error: (_, _) => AppErrorState(
            onRetry: () => ref.invalidate(collectionsProvider),
          ),
          data: (collections) {
            if (collections.isEmpty) {
              return AppEmptyState(
                icon: Icons.folder_open_rounded,
                title: AppStrings.collectionsEmpty,
                message: AppStrings.collectionsEmptyMessage,
                actionLabel: AppStrings.createCollection,
                onAction: () => showDialog<bool>(
                  context: context,
                  builder: (_) => const CreateCollectionDialog(),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Text(
                  AppStrings.collectionsTitle,
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  AppStrings.collectionCount(collections.length),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                ...collections.map(
                  (collection) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.cardGap),
                    child: AppCard(
                      onTap: () => context.push(
                        RoutePaths.collectionById(collection.id),
                      ),
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
                                Text(
                                  collection.name,
                                  style: theme.textTheme.titleSmall,
                                ),
                                if (collection.description != null &&
                                    collection.description!.isNotEmpty) ...[
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    collection.description!,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  Formatters.formatRelativeTime(
                                    collection.updatedAt,
                                  ),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppBadge(
                            label: '${collection.requestCount}',
                            variant: AppBadgeVariant.neutral,
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert_rounded),
                            onPressed: () =>
                                _showCollectionMenu(context, ref, collection),
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
