import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import '../../constants/color_manager.dart';
import 'button_dashed.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.onPressed,
    this.isDashed = false,
    required this.text,
    required this.icon,
  });

  final Function()? onPressed;
  final bool? isDashed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return isDashed!
        ? ButtonDashedWithIcon(onPressed: onPressed, text: text, icon: icon)
        : ElevatedButton.icon(
            onPressed: onPressed,
            label: Text(
              text,
              style: context.bold.copyWith(
                fontSize: 16,
                color: ColorManager.backgroundPrimaryColor,
              ),
            ),
            icon: Icon(icon, color: ColorManager.backgroundPrimaryColor),
          );
  }
}
