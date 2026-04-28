import 'package:flutter/material.dart';

import '../../constants/color_manager.dart';

class ButtonOutLine extends StatelessWidget {
  const ButtonOutLine({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

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
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: ColorManager.primaryColorApp,
              ),
            )
          : Text(
              text,
              style: const TextStyle(color: ColorManager.primaryColorApp),
            ),
    );
  }
}
