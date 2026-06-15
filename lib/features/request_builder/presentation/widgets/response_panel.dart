import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_empty_state.dart';
import '../../../../shared/widgets/app_error_state.dart';
import '../controllers/request_builder_controller.dart';
import 'response_meta_bar.dart';
import 'response_tabs.dart';

class ResponsePanel extends ConsumerWidget {
  const ResponsePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(requestBuilderControllerProvider);
    final theme = Theme.of(context);
    final hasError = state.validationError != null || state.requestError != null;

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            child: Text(
              AppStrings.responseTitle,
              style: theme.textTheme.titleSmall,
            ),
          ),
          if (!state.hasResponse && !hasError)
            Expanded(
              child: AppEmptyState(
                icon: Icons.http_rounded,
                title: AppStrings.responseEmptyTitle,
                message: AppStrings.responseEmptyMessage,
              ),
            )
          else if (!state.hasResponse && hasError)
            Expanded(
              child: AppErrorState(
                title: AppStrings.errorTitle,
                message: state.validationError ??
                    state.requestError ??
                    AppStrings.errorMessage,
              ),
            )
          else ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: ResponseMetaBar(),
            ),
            const Expanded(child: ResponseTabs()),
          ],
        ],
      ),
    );
  }
}
