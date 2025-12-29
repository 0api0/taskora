import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextStyle get extraBold => Theme.of(this).textTheme.titleLarge!;

  TextStyle get bold => Theme.of(this).textTheme.titleMedium!;

  TextStyle get regular => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get medium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get small => Theme.of(this).textTheme.bodySmall!;
}
