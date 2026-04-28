import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';

import 'button_outline.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isOutline = false,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  final bool isOutline;
  final String text;
  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isOutline
        ? ButtonOutLine(text: text, onPressed: onPressed, isLoading: isLoading)
        : ElevatedButton(
            onPressed: onPressed,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ColorManager.primaryColorApp,
                    ),
                  )
                : Text(text),
          );
  }
}
