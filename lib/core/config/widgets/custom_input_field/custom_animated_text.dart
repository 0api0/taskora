import 'package:flutter/material.dart';

import '../../constants/color_manager.dart';
import 'custom_input_field.dart';

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    super.key,
    required this.fontSize,
    required this.hasFocus,
    required this.widget,
  });

  final double fontSize;
  final bool hasFocus;
  final CustomInputFiled widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: fontSize,
        color: hasFocus
            ? ColorManager.textPrimaryColor
            : ColorManager.textDarkColor,
        fontWeight: FontWeight.w500,
        height: 20 / fontSize,
      ),
      child: Text(widget.text),
    );
  }
}
