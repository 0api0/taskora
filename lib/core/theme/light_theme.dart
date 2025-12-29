import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';

class ThemeDataLight {
  ThemeDataLight._();

  static const String fontFamily = 'Cairo';

  static final ThemeData themeData = ThemeData(
    // general
    brightness: Brightness.light,
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryColorApp,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: ColorManager.backgroundPrimaryColor,

    // Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        elevation: WidgetStateProperty.all(0),
        // background ' if disabled and if enabled '
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ColorManager.backgroundDisable;
          }
          return ColorManager.primaryColorApp;
        }),

        // foreground color for color text
        foregroundColor: WidgetStateProperty.all(
          ColorManager.backgroundPrimaryColor,
        ),

        // here no color text bec.. widget state maybe disabled or enabled...
        //  but color in text in (ui view , not themeData) well be visible
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily,
            height: 20 / 16,
            letterSpacing: 0,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    ),
    // Text theme
    textTheme: TextTheme(
      // extra bold
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 28,
        height: 100 / 28,
        letterSpacing: 0,
      ),

      // bold
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 30 / 18,
        letterSpacing: 0,
      ),

      // Regular
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 100 / 14,
        letterSpacing: 0,
      ),

      // Medium
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 100 / 12,
        letterSpacing: 0,
      ),

      // small
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 8,
        height: 14 / 8,
        letterSpacing: 0,
      ),
    ),
  );
}
