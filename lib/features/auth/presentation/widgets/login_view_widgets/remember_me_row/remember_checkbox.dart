import 'package:flutter/material.dart';

import '../../../../../../core/config/constants/color_manager.dart';

class RememberCheckBox extends StatelessWidget {
  const RememberCheckBox({super.key, required this.value, required this.onTap});

  final bool value;
  final VoidCallback onTap;

  static const double _boxSize = 12;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _boxSize,
        height: _boxSize,
        decoration: BoxDecoration(
          color: value ? ColorManager.primaryColorApp : Colors.transparent,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: ColorManager.primaryColorApp, width: 1.5),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 10,
                color: ColorManager.backgroundPrimaryColor,
              )
            : null,
      ),
    );
  }
}
