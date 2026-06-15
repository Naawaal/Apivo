import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTypography {
  static TextStyle get fontFamily => GoogleFonts.inter();

  static TextStyle displayLarge({Color? color}) => fontFamily.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: color,
      );

  static TextStyle displayMedium({Color? color}) => fontFamily.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        color: color,
      );

  static TextStyle titleLarge({Color? color}) => fontFamily.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle titleMedium({Color? color}) => fontFamily.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle titleSmall({Color? color}) => fontFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: color,
      );

  static TextStyle headlineMedium({Color? color}) => fontFamily.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        color: color,
      );

  static TextStyle bodyLarge({Color? color}) => fontFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: color,
      );

  static TextStyle bodyMedium({Color? color}) => fontFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: color,
      );

  static TextStyle bodySmall({Color? color}) => fontFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: color,
      );

  static TextStyle labelLarge({Color? color}) => fontFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: color,
      );

  static TextStyle labelMedium({Color? color}) => fontFamily.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: color,
      );

  static TextStyle labelSmall({Color? color}) => fontFamily.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: color,
      );
}
