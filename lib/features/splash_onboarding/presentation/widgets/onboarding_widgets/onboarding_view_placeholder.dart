import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import 'package:taskora/features/splash_onboarding/domain/entities/onboarding_page_entity.dart';

class OnboardingPagePlaceholder extends StatelessWidget {
  final int index;
  final OnboardingPageEntity onboardingPageEntity;

  const OnboardingPagePlaceholder({
    super.key,
    required this.index,
    required this.onboardingPageEntity,
  });

  @override
  Widget build(BuildContext context) {
    final descColor = onboardingPageEntity.isDark
        ? ColorManager.backgroundPrimaryColor
        : ColorManager.textHintColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          SizedBox(
            height: 260,
            child: Image.asset(
              onboardingPageEntity.imagePath,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 22),

          // Title
          Text(
            onboardingPageEntity.title,
            textAlign: TextAlign.center,
            style: context.bold.copyWith(color: ColorManager.textDarkColor),
          ),

          const SizedBox(height: 10),

          // Description
          Text(
            onboardingPageEntity.description,
            textAlign: TextAlign.center,
            style: context.regular.copyWith(color: descColor),
          ),
        ],
      ),
    );
  }
}
