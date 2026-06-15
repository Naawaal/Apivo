import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../collections/data/collections_repository.dart';
import '../../../collections/presentation/collections_providers.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../controllers/request_builder_controller.dart';

class SaveRequestDialog extends ConsumerStatefulWidget {
  const SaveRequestDialog({
    super.key,
    this.initialName,
    this.initialCollectionId,
  });

  final String? initialName;
  final String? initialCollectionId;

  @override
  ConsumerState<SaveRequestDialog> createState() => _SaveRequestDialogState();
}

class _SaveRequestDialogState extends ConsumerState<SaveRequestDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _newCollectionController;
  String? _selectedCollectionId;
  bool _showNewCollection = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _newCollectionController = TextEditingController();
    _selectedCollectionId = widget.initialCollectionId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _newCollectionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _isSaving = true);

    var collectionId = _selectedCollectionId;
    if (_showNewCollection) {
      final newName = _newCollectionController.text.trim();
      if (newName.isNotEmpty) {
        final created = await ref
            .read(collectionsRepositoryProvider)
            .createCollection(name: newName);
        collectionId = created.id;
      }
    }

    final success = await ref
        .read(requestBuilderControllerProvider.notifier)
        .saveCurrentRequest(name: name, collectionId: collectionId);

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (success) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final collections = ref.watch(collectionsProvider);

    return AlertDialog(
      title: const Text(AppStrings.saveRequestTitle),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: AppStrings.requestName,
              hint: AppStrings.requestNameHint,
              controller: _nameController,
            ),
            const SizedBox(height: AppSpacing.lg),
            collections.when(
              data: (items) => DropdownButtonFormField<String?>(
                key: ValueKey(_selectedCollectionId),
                initialValue: _showNewCollection ? null : _selectedCollectionId,
                decoration: const InputDecoration(
                  labelText: AppStrings.collectionLabel,
                ),
                items: [
                  const DropdownMenuItem<String?>(
                    value: null,
                    child: Text(AppStrings.noCollection),
                  ),
                  ...items.map(
                    (c) => DropdownMenuItem<String?>(
                      value: c.id,
                      child: Text(c.name),
                    ),
                  ),
                ],
                onChanged: _showNewCollection
                    ? null
                    : (value) => setState(() => _selectedCollectionId = value),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => setState(() => _showNewCollection = !_showNewCollection),
              child: Text(
                _showNewCollection
                    ? AppStrings.useExistingCollection
                    : AppStrings.createCollectionInline,
              ),
            ),
            if (_showNewCollection) ...[
              const SizedBox(height: AppSpacing.sm),
              AppTextField(
                label: AppStrings.newCollectionName,
                hint: AppStrings.newCollectionNameHint,
                controller: _newCollectionController,
              ),
            ],
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
