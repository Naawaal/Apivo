import 'package:flutter/material.dart';

import '../../core/design/tokens/app_breakpoints.dart';
import '../../core/design/tokens/app_spacing.dart';
import '../../core/utils/extensions.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    required this.child,
    this.vertical = AppSpacing.lg,
  });

  final Widget child;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    final horizontal = _horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: child,
    );
  }

  static double horizontalPadding(BuildContext context) {
    return _horizontalPadding(context);
  }

  static double _horizontalPadding(BuildContext context) {
    final width = context.screenWidth;
    if (width >= AppBreakpoints.expanded) {
      return AppSpacing.pageHorizontalExpanded;
    }
    if (width >= AppBreakpoints.compact) {
      return AppSpacing.pageHorizontalMedium;
    }
    return AppSpacing.pageHorizontalCompact;
  }
}
