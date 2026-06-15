import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../data/environments_repository.dart';

class CreateEnvironmentDialog extends ConsumerStatefulWidget {
  const CreateEnvironmentDialog({super.key});

  @override
  ConsumerState<CreateEnvironmentDialog> createState() =>
      _CreateEnvironmentDialogState();
}

class _CreateEnvironmentDialogState
    extends ConsumerState<CreateEnvironmentDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isSaving = true);
    await ref.read(environmentsRepositoryProvider).createEnvironment(
          name: name,
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
        );
    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.createEnvironment),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              label: AppStrings.environmentName,
              hint: AppStrings.environmentNameHint,
              controller: _nameController,
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextField(
              label: AppStrings.environmentDescription,
              hint: AppStrings.environmentDescriptionHint,
              controller: _descriptionController,
              maxLines: 2,
            ),
          ],
        ),
      ),
      actions: [
        AppButton(
          label: AppStrings.cancel,
          variant: AppButtonVariant.ghost,
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(false),
        ),
        AppButton(
          label: AppStrings.create,
          isLoading: _isSaving,
          onPressed: _isSaving ? null : _create,
        ),
      ],
    );
  }
}
