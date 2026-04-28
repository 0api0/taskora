import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingScaffold =>
      const EdgeInsets.only(right: 20, left: 20, top: 40);
}
