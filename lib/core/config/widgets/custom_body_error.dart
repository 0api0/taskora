import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/config/widgets/custom_button/custom_button.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

class CustomBodyError extends StatelessWidget {
  const CustomBodyError({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.textButton,
    required this.textButtonOutline,
    this.onPressed,
    this.onPressedOutline,
  });

  final String image;
  final String title;
  final String textButton;
  final String textButtonOutline;
  final String subTitle;
  final Function()? onPressed;
  final Function()? onPressedOutline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingScaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 100, height: 100),
          context.sizedBoxHeight_22,
          Text(
            title,
            style: context.bold.copyWith(color: ColorManager.textDarkColor),
          ),
          context.sizedBoxHeight_4,
          Text(
            subTitle,
            style: context.regular.copyWith(color: ColorManager.textHintColor),
          ),
          context.sizedBoxHeight_36,
          CustomButton(text: textButton, onPressed: onPressed),
          context.sizedBoxHeight_8,
          CustomButton(
            text: textButtonOutline,
            onPressed: onPressedOutline,
            isOutline: true,
          ),
        ],
      ),
    );
  }
}
