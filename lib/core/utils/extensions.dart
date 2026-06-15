import 'package:flutter/material.dart';

import '../design/tokens/app_breakpoints.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isCompact => screenWidth < AppBreakpoints.compact;
  bool get isMedium =>
      screenWidth >= AppBreakpoints.compact &&
      screenWidth < AppBreakpoints.medium;
  bool get isExpanded => screenWidth >= AppBreakpoints.medium;
}
