import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size = AppSizes.iconLg,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;

  @override
  Widget build(BuildContext context) {
    final button = IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: size),
      iconSize: size,
      constraints: const BoxConstraints(
        minWidth: 40,
        minHeight: 40,
      ),
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: button);
    }
    return button;
  }
}
