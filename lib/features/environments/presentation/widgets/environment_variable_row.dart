import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../data/environments_repository.dart';
import '../../domain/environment_model.dart';

class EnvironmentVariableRow extends ConsumerStatefulWidget {
  const EnvironmentVariableRow({super.key, required this.variable});

  final EnvironmentVariableModel variable;

  @override
  ConsumerState<EnvironmentVariableRow> createState() =>
      _EnvironmentVariableRowState();
}

class _EnvironmentVariableRowState extends ConsumerState<EnvironmentVariableRow> {
  late final TextEditingController _keyController;
  late final TextEditingController _valueController;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _keyController = TextEditingController(text: widget.variable.key);
    _valueController = TextEditingController(text: widget.variable.value);
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
    if (keyError != null) return;

    await ref.read(environmentsRepositoryProvider).updateVariable(
          widget.variable.copyWith(
            key: key,
            value: _valueController.text,
          ),
        );
  }

  Future<void> _delete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteVariableTitle),
        content: Text(AppStrings.deleteVariableMessage(widget.variable.key)),
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
          .deleteVariable(widget.variable.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final variable = widget.variable;
    final obscure = variable.isSecret && !_revealed;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.cardGap),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    label: AppStrings.variableKey,
                    controller: _keyController,
                    onChanged: (_) => _save(),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  flex: 3,
                  child: AppTextField(
                    label: AppStrings.variableValue,
                    controller: _valueController,
                    obscureText: obscure,
                    onChanged: (_) => _save(),
                    suffixIcon: variable.isSecret
                        ? IconButton(
                            icon: Icon(
                              _revealed
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () =>
                                setState(() => _revealed = !_revealed),
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                FilterChip(
                  label: const Text(AppStrings.variableSecret),
                  selected: variable.isSecret,
                  onSelected: (value) => ref
                      .read(environmentsRepositoryProvider)
                      .toggleVariableSecret(variable.id, value),
                ),
                const SizedBox(width: AppSpacing.sm),
                FilterChip(
                  label: const Text(AppStrings.variableEnabled),
                  selected: variable.isEnabled,
                  onSelected: (value) => ref
                      .read(environmentsRepositoryProvider)
                      .toggleVariableEnabled(variable.id, value),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: _delete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
