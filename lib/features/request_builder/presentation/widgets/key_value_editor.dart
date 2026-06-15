import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../domain/request_key_value.dart';

typedef KeyValueItemCallback = void Function({
  required String id,
  String? key,
  String? value,
  bool? enabled,
});

class KeyValueEditor extends StatelessWidget {
  const KeyValueEditor({
    super.key,
    required this.items,
    required this.onAdd,
    required this.onRemove,
    required this.onUpdate,
    this.emptyMessage = AppStrings.keyValueEmpty,
  });

  final List<RequestKeyValue> items;
  final VoidCallback onAdd;
  final void Function(String id) onRemove;
  final KeyValueItemCallback onUpdate;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            child: Text(
              emptyMessage,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          )
        else
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _KeyValueRow(
                key: ValueKey(item.id),
                item: item,
                onRemove: () => onRemove(item.id),
                onUpdate: onUpdate,
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
        Align(
          alignment: Alignment.centerLeft,
          child: AppButton(
            label: AppStrings.addRow,
            icon: Icons.add_rounded,
            variant: AppButtonVariant.outline,
            size: AppButtonSize.small,
            onPressed: onAdd,
          ),
        ),
      ],
    );
  }
}

class _KeyValueRow extends StatefulWidget {
  const _KeyValueRow({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onUpdate,
  });

  final RequestKeyValue item;
  final VoidCallback onRemove;
  final KeyValueItemCallback onUpdate;

  @override
  State<_KeyValueRow> createState() => _KeyValueRowState();
}

class _KeyValueRowState extends State<_KeyValueRow> {
  late final TextEditingController _keyController;
  late final TextEditingController _valueController;

  @override
  void initState() {
    super.initState();
    _keyController = TextEditingController(text: widget.item.key);
    _valueController = TextEditingController(text: widget.item.value);
  }

  @override
  void didUpdateWidget(_KeyValueRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.key != widget.item.key &&
        _keyController.text != widget.item.key) {
      _keyController.text = widget.item.key;
    }
    if (oldWidget.item.value != widget.item.value &&
        _valueController.text != widget.item.value) {
      _valueController.text = widget.item.value;
    }
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppTextField(
            hint: AppStrings.keyPlaceholder,
            controller: _keyController,
            onChanged: (value) => widget.onUpdate(id: widget.item.id, key: value),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: AppTextField(
            hint: AppStrings.valuePlaceholder,
            controller: _valueController,
            onChanged: (value) =>
                widget.onUpdate(id: widget.item.id, value: value),
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Switch(
          value: widget.item.enabled,
          onChanged: (enabled) =>
              widget.onUpdate(id: widget.item.id, enabled: enabled),
        ),
        IconButton(
          icon: const Icon(Icons.close_rounded, size: 18),
          onPressed: widget.onRemove,
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}
