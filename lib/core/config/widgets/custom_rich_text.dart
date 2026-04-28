import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

class CustomRichTextRow extends StatelessWidget {
  const CustomRichTextRow({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  final String text;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.regular.copyWith(
          fontSize: 12,
          color: ColorManager.textHintColor,
        ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: actionText,
            style: context.regular.copyWith(
              fontSize: 12,
              color: ColorManager.primaryColorApp,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
