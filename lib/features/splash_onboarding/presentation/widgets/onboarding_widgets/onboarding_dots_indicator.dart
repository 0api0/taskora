import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_sizes.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  const OnboardingDotsIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.activeColor,
    required this.inactiveColor,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.spaceSmall_4),
          width: isActive
              ? AppSizes.circleOnBoardingSelected
              : AppSizes.circleOnBoarding,
          height: AppSizes.circleOnBoarding,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
