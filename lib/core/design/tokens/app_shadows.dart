import 'package:flutter/material.dart';

abstract final class AppShadows {
  static List<BoxShadow> sm({Color color = Colors.black}) => [
        BoxShadow(
          color: color.withValues(alpha: 0.04),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.02),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> md({Color color = Colors.black}) => [
        BoxShadow(
          color: color.withValues(alpha: 0.06),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.04),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ];

  static List<BoxShadow> lg({Color color = Colors.black}) => [
        BoxShadow(
          color: color.withValues(alpha: 0.08),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: color.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
}
