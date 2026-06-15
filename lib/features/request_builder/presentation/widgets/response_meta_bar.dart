import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_badge.dart';
import '../../domain/http_status_group.dart';
import '../controllers/request_builder_controller.dart';

class ResponseMetaBar extends ConsumerWidget {
  const ResponseMetaBar({super.key});

  AppBadgeVariant _statusVariant(HttpStatusGroup group) {
    return switch (group) {
      HttpStatusGroup.success => AppBadgeVariant.success,
      HttpStatusGroup.redirect => AppBadgeVariant.info,
      HttpStatusGroup.clientError => AppBadgeVariant.warning,
      HttpStatusGroup.serverError => AppBadgeVariant.error,
      HttpStatusGroup.unknown => AppBadgeVariant.neutral,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(requestBuilderControllerProvider);
    final response = state.response;
    if (response == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: [
          if (response.statusCode != null)
            AppBadge(
              label:
                  '${response.statusCode} ${response.statusMessage ?? ''}'.trim(),
              variant: _statusVariant(response.statusGroup),
            ),
          AppBadge(
            label: response.formattedDuration,
            variant: AppBadgeVariant.neutral,
          ),
          AppBadge(
            label: response.formattedSize,
            variant: AppBadgeVariant.neutral,
          ),
          if (response.contentType != null && response.contentType!.isNotEmpty)
            AppBadge(
              label: response.contentType!,
              variant: AppBadgeVariant.info,
            ),
        ],
      ),
    );
  }
}
