import 'package:flutter/material.dart';

import '../../core/design/tokens/app_radius.dart';
import '../../core/design/tokens/app_spacing.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.icon,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      avatar: icon != null ? Icon(icon, size: 16) : null,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.smRadius),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
    );
  }
}
