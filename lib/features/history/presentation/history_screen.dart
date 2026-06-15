import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/design/tokens/app_spacing.dart';
import '../../../core/router/route_paths.dart';
import '../../../shared/layout/adaptive_page.dart';
import '../../../shared/widgets/app_badge.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/app_empty_state.dart';
import '../../../shared/widgets/app_error_state.dart';
import '../../../shared/widgets/app_loading.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../../request_builder/domain/http_method_type.dart';
import '../data/request_history_repository.dart';
import '../domain/request_history_model.dart';
import 'history_providers.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  AppBadgeVariant _statusVariant(RequestHistoryModel item) {
    final code = item.statusCode;
    if (code == null) return AppBadgeVariant.error;
    if (code >= 200 && code < 300) return AppBadgeVariant.success;
    if (code >= 400 && code < 500) return AppBadgeVariant.warning;
    if (code >= 500) return AppBadgeVariant.error;
    return AppBadgeVariant.info;
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.clearHistoryTitle),
        content: const Text(AppStrings.clearHistoryMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(AppStrings.clear),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(requestHistoryRepositoryProvider).clearHistory();
    }
  }

  void _openHistoryItem(BuildContext context, String id) {
    context.push(RoutePaths.request, extra: id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final historyAsync = ref.watch(requestHistoryProvider);

    return AppScaffold(
      showAppBar: false,
      body: AdaptivePage(
        child: historyAsync.when(
          loading: () => const AppLoading(),
          error: (_, _) => AppErrorState(
            onRetry: () => ref.invalidate(requestHistoryProvider),
          ),
          data: (history) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.historyTitle,
                            style: theme.textTheme.displayMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            AppStrings.historyCount(history.length),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (history.isNotEmpty)
                      TextButton.icon(
                        onPressed: () => _confirmClear(context, ref),
                        icon: const Icon(Icons.delete_sweep_outlined),
                        label: const Text(AppStrings.clearHistory),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                if (history.isEmpty)
                  const Expanded(
                    child: AppEmptyState(
                      icon: Icons.history_rounded,
                      title: AppStrings.historyEmpty,
                      message: AppStrings.historyEmptyMessage,
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: history.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: AppSpacing.cardGap),
                      itemBuilder: (context, index) {
                        final item = history[index];
                        return AppCard(
                          onTap: () => _openHistoryItem(context, item.id),
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Row(
                            children: [
                              AppBadge(
                                label: item.method.label,
                                variant: AppBadgeVariant.info,
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.displayUrl,
                                      style: theme.textTheme.bodyMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: AppSpacing.xs),
                                    Row(
                                      children: [
                                        Text(
                                          item.formattedSentAt,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        const SizedBox(width: AppSpacing.sm),
                                        Text(
                                          '${item.durationMs} ms',
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        if (item.errorMessage != null) ...[
                                          const SizedBox(width: AppSpacing.sm),
                                          Icon(
                                            Icons.error_outline,
                                            size: 14,
                                            color: theme.colorScheme.error,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (item.statusCode != null)
                                AppBadge(
                                  label: '${item.statusCode}',
                                  variant: _statusVariant(item),
                                )
                              else
                                AppBadge(
                                  label: AppStrings.failed,
                                  variant: AppBadgeVariant.error,
                                ),
                            ],
                          ),
                        );
                      },
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
