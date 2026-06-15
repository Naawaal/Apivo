import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../data/environments_repository.dart';

class AddVariableDialog extends ConsumerStatefulWidget {
  const AddVariableDialog({super.key, required this.environmentId});

  final String environmentId;

  @override
  ConsumerState<AddVariableDialog> createState() => _AddVariableDialogState();
}

class _AddVariableDialogState extends ConsumerState<AddVariableDialog> {
  late final TextEditingController _keyController;
  late final TextEditingController _valueController;
  bool _isSecret = false;
  bool _isEnabled = true;
  bool _isSaving = false;
  String? _keyError;

  @override
  void initState() {
    super.initState();
    _keyController = TextEditingController();
    _valueController = TextEditingController();
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final key = _keyController.text.trim();
    final keyError = Validators.isValidVariableKey(key);
    if (keyError != null) {
      setState(() => _keyError = keyError);
      return;
    }

    setState(() {
      _isSaving = true;
      _keyError = null;
    });

    await ref.read(environmentsRepositoryProvider).addVariable(
          environmentId: widget.environmentId,
          key: key,
          value: _valueController.text,
          isSecret: _isSecret,
          isEnabled: _isEnabled,
        );

    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.addVariable),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              label: AppStrings.variableKey,
              hint: AppStrings.variableKeyHint,
              controller: _keyController,
              errorText: _keyError,
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextField(
              label: AppStrings.variableValue,
              hint: AppStrings.variableValueHint,
              controller: _valueController,
              obscureText: _isSecret,
            ),
            const SizedBox(height: AppSpacing.md),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(AppStrings.variableSecret),
              value: _isSecret,
              onChanged: (value) => setState(() => _isSecret = value),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(AppStrings.variableEnabled),
              value: _isEnabled,
              onChanged: (value) => setState(() => _isEnabled = value),
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
          label: AppStrings.save,
          isLoading: _isSaving,
          onPressed: _isSaving ? null : _save,
        ),
      ],
    );
  }
}
