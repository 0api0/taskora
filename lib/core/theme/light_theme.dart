import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';

class ThemeDataLight {
  ThemeDataLight._();

  static const String _fontFamily = 'Cairo';

  static final ThemeData themeData = ThemeData(
    // general
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryColorApp,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: ColorManager.backgroundPrimaryColor,

    // Text theme
    textTheme: TextTheme(
      // extra bold
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 28,
        height: 100,
        letterSpacing: 0,
      ),

      // bold
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 30,
        letterSpacing: 0,
      ),

      // Regular
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 100,
        letterSpacing: 0,
      ),

      // Medium
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 100,
        letterSpacing: 0,
      ),

      // small
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 8,
        height: 14,
        letterSpacing: 0,
      ),
    ),
  );
}
