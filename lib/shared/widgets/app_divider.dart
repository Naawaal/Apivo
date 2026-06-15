import 'package:flutter/material.dart';

import '../../core/design/tokens/app_spacing.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.vertical = false,
    this.spacing = AppSpacing.lg,
  });

  final bool vertical;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    if (vertical) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: const VerticalDivider(width: 1),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: const Divider(height: 1),
    );
  }
}
