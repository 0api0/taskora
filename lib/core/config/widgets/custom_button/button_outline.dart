import 'package:flutter/material.dart';

import '../../constants/color_manager.dart';

class ButtonOutLine extends StatelessWidget {
  const ButtonOutLine({super.key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.backgroundPrimaryColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorManager.primaryColorApp),
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: ColorManager.primaryColorApp),
      ),
    );
  }
}
