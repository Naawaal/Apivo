import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../domain/request_body_type.dart';
import '../controllers/request_builder_controller.dart';
import 'key_value_editor.dart';

class BodyEditor extends ConsumerStatefulWidget {
  const BodyEditor({super.key});

  @override
  ConsumerState<BodyEditor> createState() => _BodyEditorState();
}

class _BodyEditorState extends ConsumerState<BodyEditor> {
  TextEditingController? _bodyController;

  @override
  void dispose() {
    _bodyController?.dispose();
    super.dispose();
  }

  TextEditingController _controllerFor(String text) {
    _bodyController ??= TextEditingController(text: text);
    if (_bodyController!.text != text) {
      _bodyController!.text = text;
    }
    return _bodyController!;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(requestBuilderControllerProvider);
    final notifier = ref.read(requestBuilderControllerProvider.notifier);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<RequestBodyType>(
            initialValue: state.bodyType,
            decoration: InputDecoration(
              labelText: AppStrings.bodyType,
            ),
            items: RequestBodyType.values
                .map(
                  (type) => DropdownMenuItem(
                    value: type,
                    child: Text(type.label),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                _bodyController?.dispose();
                _bodyController = null;
                notifier.setBodyType(value);
              }
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          switch (state.bodyType) {
            RequestBodyType.none => Text(
                AppStrings.bodyNoneMessage,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            RequestBodyType.json => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    hint: AppStrings.jsonBodyHint,
                    controller: _controllerFor(state.bodyText),
                    maxLines: 8,
                    errorText: state.validationError,
                    onChanged: notifier.setBodyText,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      AppButton(
                        label: AppStrings.formatJson,
                        icon: Icons.code_rounded,
                        variant: AppButtonVariant.outline,
                        size: AppButtonSize.small,
                        onPressed: notifier.formatJson,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      AppButton(
                        label: AppStrings.clearBody,
                        icon: Icons.clear_rounded,
                        variant: AppButtonVariant.ghost,
                        size: AppButtonSize.small,
                        onPressed: () {
                          _bodyController?.clear();
                          notifier.clearBody();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            RequestBodyType.text => AppTextField(
                hint: AppStrings.textBodyHint,
                controller: _controllerFor(state.bodyText),
                maxLines: 8,
                onChanged: notifier.setBodyText,
              ),
            RequestBodyType.formData => KeyValueEditor(
                items: state.formDataFields,
                emptyMessage: AppStrings.formDataEmpty,
                onAdd: notifier.addFormDataField,
                onRemove: notifier.removeFormDataField,
                onUpdate: notifier.updateFormDataField,
              ),
            RequestBodyType.urlEncoded => KeyValueEditor(
                items: state.urlEncodedFields,
                emptyMessage: AppStrings.urlEncodedEmpty,
                onAdd: notifier.addUrlEncodedField,
                onRemove: notifier.removeUrlEncodedField,
                onUpdate: notifier.updateUrlEncodedField,
              ),
            RequestBodyType.binary => AppCard(
                child: Column(
                  children: [
                    Icon(
                      Icons.upload_file_rounded,
                      size: 32,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      AppStrings.binaryPlaceholderTitle,
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      AppStrings.binaryPlaceholderMessage,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          },
        ],
      ),
    );
  }
}
