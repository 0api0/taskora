import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  const OnboardingDotsIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 30 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive
                ? ColorManager.primaryColorApp
                : ColorManager.primaryColorApp.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
