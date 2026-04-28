import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import '../../constants/color_manager.dart';

class ButtonDashedWithIcon extends StatelessWidget {
  const ButtonDashedWithIcon({
    super.key,
    this.onPressed,
    required this.text,
    required this.icon,
  });

  final Function()? onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        dashPattern: [10, 10],
        radius: Radius.circular(4),
        color: ColorManager.primaryColorApp,
        padding: EdgeInsets.zero,
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          overlayColor: ColorManager.primaryColorApp,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadiusGeometry.circular(4),
          ),
        ),
        label: Text(
          text,
          style: context.bold.copyWith(
            color: ColorManager.primaryColorApp,
            fontSize: 16,
          ),
        ),
        icon: Icon(icon, color: ColorManager.primaryColorApp),
      ),
    );
  }
}

/*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorManager.primaryColorApp),
            Text(
              text,
              style: const TextStyle(color: ColorManager.primaryColorApp),
            ),
          ],
        )*/
