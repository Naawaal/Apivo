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
import '../../request_builder/domain/http_method_type.dart';
import '../../saved_requests/data/saved_requests_repository.dart';
import '../../saved_requests/domain/saved_request_model.dart';
import '../../saved_requests/presentation/saved_requests_providers.dart';
import '../data/collections_repository.dart';

class CollectionDetailScreen extends ConsumerWidget {
  const CollectionDetailScreen({super.key, required this.collectionId});

  final String collectionId;

  Future<void> _confirmDeleteRequest(
    BuildContext context,
    WidgetRef ref,
    SavedRequestModel request,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteRequestTitle),
        content: Text(AppStrings.deleteRequestMessage(request.name)),
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
          .read(savedRequestsRepositoryProvider)
          .deleteSavedRequest(request.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final collectionAsync = ref.watch(
      FutureProvider((ref) async {
        return ref
            .read(collectionsRepositoryProvider)
            .getCollectionById(collectionId);
      }),
    );
    final requestsAsync =
        ref.watch(savedRequestsByCollectionProvider(collectionId));

    return AppScaffold(
      showAppBar: true,
      title: collectionAsync.maybeWhen(
        data: (c) => c?.name ?? AppStrings.collectionsTitle,
        orElse: () => AppStrings.collectionsTitle,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => context.pop(),
      ),
      body: AdaptivePage(
        child: requestsAsync.when(
          loading: () => const AppLoading(),
          error: (_, _) => AppErrorState(
            onRetry: () =>
                ref.invalidate(savedRequestsByCollectionProvider(collectionId)),
          ),
          data: (requests) {
            if (requests.isEmpty) {
              return AppEmptyState(
                icon: Icons.http_rounded,
                title: AppStrings.noSavedRequests,
                message: AppStrings.noSavedRequestsMessage,
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.only(
                top: AppSpacing.lg,
                bottom: AppSpacing.lg,
              ),
              itemCount: requests.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: AppSpacing.cardGap),
              itemBuilder: (context, index) {
                final request = requests[index];
                final subtitle = request.lastSentAt != null
                    ? 'Last sent ${Formatters.formatRelativeTime(request.lastSentAt!)}'
                    : 'Updated ${Formatters.formatRelativeTime(request.updatedAt)}';

                return AppCard(
                  onTap: () =>
                      context.push(RoutePaths.requestById(request.id)),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      AppBadge(
                        label: request.method.label,
                        variant: AppBadgeVariant.info,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              request.name,
                              style: theme.textTheme.titleSmall,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              request.url,
                              style: theme.textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              subtitle,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () =>
                            _confirmDeleteRequest(context, ref, request),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
