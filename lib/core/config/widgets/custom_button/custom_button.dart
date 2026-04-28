import 'package:flutter/material.dart';

import 'button_outline.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isOutline = false,
    required this.text,
    this.onPressed,
  });

  final bool isOutline;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return isOutline
        ? ButtonOutLine(text: text, onPressed: onPressed)
        : ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
