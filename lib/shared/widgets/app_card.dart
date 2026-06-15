import 'package:flutter/material.dart';

import '../../core/design/tokens/app_radius.dart';
import '../../core/design/tokens/app_spacing.dart';
import '../../core/design/theme/theme_extension.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.showBorder = true,
    this.onTap,
    this.margin,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
      child: child,
    );

    final card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: AppRadius.lgRadius,
        border: showBorder ? Border.all(color: theme.appBorderColor) : null,
        boxShadow: theme.appShadows,
      ),
      child: Material(
        color: Colors.transparent,
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                borderRadius: AppRadius.lgRadius,
                child: content,
              )
            : content,
      ),
    );

    return card;
  }
}
