import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/utils/extensions.dart';
import '../widgets/responsive_padding.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.alignTop = false,
  });

  final Widget child;
  final double? maxWidth;
  final bool alignTop;

  @override
  Widget build(BuildContext context) {
    final effectiveMaxWidth = maxWidth ??
        (context.isExpanded
            ? AppSizes.maxContentWidthTablet
            : AppSizes.maxContentWidthMobile);

    return Align(
      alignment: alignTop ? Alignment.topCenter : Alignment.center,
      child: ResponsivePadding(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
          child: child,
        ),
      ),
    );
  }
}
