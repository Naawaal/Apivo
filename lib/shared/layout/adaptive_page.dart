import 'package:flutter/material.dart';

import '../../core/design/tokens/app_spacing.dart';
import '../layout/page_container.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({
    super.key,
    required this.child,
    this.maxWidth,
  });

  final Widget child;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      maxWidth: maxWidth,
      alignTop: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppSpacing.xxxl),
        child: child,
      ),
    );
  }
}
