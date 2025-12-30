import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';

class ThemeDataLight {
  const ThemeDataLight._();

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

    // text filed (input deco...)
    inputDecorationTheme: InputDecorationTheme(
      // Border states
      border: _border(ColorManager.textHintColor),
      enabledBorder: _border(ColorManager.textHintColor),
      focusedBorder: _border(ColorManager.primaryColorApp),
      errorBorder: _border(ColorManager.statusRedColor),
      focusedErrorBorder: _border(ColorManager.statusRedColor),

      // text style states
      errorStyle: const TextStyle(
        color: ColorManager.statusRedColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: const TextStyle(
        color: ColorManager.textHintColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.4,
        letterSpacing: 0,
      ),
    ),

    // Text theme
    textTheme: const TextTheme(
      // extra bold
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 28,
        letterSpacing: 0,
      ),

      // bold
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        letterSpacing: 0,
      ),

      // Regular
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0,
      ),

      // Medium
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: 0,
      ),

      // small
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 8,
        letterSpacing: 0,
      ),
    ),
  );
}

OutlineInputBorder _border(Color color) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: BorderSide(color: color),
);
