import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../core/variables/variable_resolver.dart';
import '../../../../shared/widgets/app_badge.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../controllers/request_builder_controller.dart';
import '../request_builder_screen.dart';
import 'request_method_selector.dart';

class RequestUrlBar extends ConsumerStatefulWidget {
  const RequestUrlBar({super.key});

  @override
  ConsumerState<RequestUrlBar> createState() => _RequestUrlBarState();
}

class _RequestUrlBarState extends ConsumerState<RequestUrlBar> {
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(
      text: ref.read(requestBuilderControllerProvider).url,
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final state = ref.read(requestBuilderControllerProvider);
    final notifier = ref.read(requestBuilderControllerProvider.notifier);

    if (state.savedRequestId == null) {
      await showSaveRequestDialog(context, ref);
      return;
    }

    final success = await notifier.updateCurrentSavedRequest();
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.requestUpdated)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(requestBuilderControllerProvider);
    final notifier = ref.read(requestBuilderControllerProvider.notifier);

    if (_urlController.text != state.url) {
      _urlController.text = state.url;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestMethodSelector(
              method: state.method,
              onChanged: notifier.setMethod,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppTextField(
                hint: AppStrings.urlPlaceholder,
                controller: _urlController,
                keyboardType: TextInputType.url,
                errorText: state.validationError ?? state.variableError,
                onChanged: notifier.setUrl,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            AppButton(
              label: state.isSaved ? AppStrings.update : AppStrings.save,
              icon: Icons.save_outlined,
              variant: AppButtonVariant.outline,
              isLoading: state.isSaving,
              onPressed: state.isSaving ? null : _handleSave,
            ),
            const SizedBox(width: AppSpacing.sm),
            AppButton(
              label: AppStrings.send,
              icon: Icons.send_rounded,
              isLoading: state.isSending,
              onPressed: state.isSending ? null : notifier.sendRequest,
            ),
          ],
        ),
        if (state.variablePreviewEnabled &&
            VariableResolver.containsVariables(state.url)) ...[
          const SizedBox(height: AppSpacing.sm),
          if (state.resolvedUrlPreview != null)
            Text(
              '${AppStrings.resolvedUrlPreview}: ${state.resolvedUrlPreview}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            )
          else if (state.hasUnresolvedVariables)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: [
                Text(
                  AppStrings.missingVariables,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
                ...state.unresolvedVariables.map(
                  (item) => AppBadge(
                    label: item.originalToken,
                    variant: AppBadgeVariant.warning,
                  ),
                ),
              ],
            ),
        ],
        if (state.isDirty && state.isSaved) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            AppStrings.unsavedChanges,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
        ],
        if (state.requestError != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            state.requestError!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        ],
      ],
    );
  }
}
