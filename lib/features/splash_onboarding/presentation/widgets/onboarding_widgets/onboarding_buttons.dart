import 'package:flutter/material.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/color_manager.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({
    super.key,
    required this.isLastPage,
    this.onGetStarted,
    this.goNext,
  });

  final bool isLastPage;
  final void Function()? onGetStarted;
  final void Function()? goNext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isLastPage
          ? ElevatedButton(
              onPressed: onGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.backgroundPrimaryColor,
              ),
              child: const Text(
                AppStrings.buttonGetStarted,
                style: TextStyle(color: ColorManager.primaryColorApp),
              ),
            )
          : ElevatedButton(
              onPressed: goNext,
              child: const Text(AppStrings.buttonNext),
            ),
    );
  }
}
