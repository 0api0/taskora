import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/color_manager.dart';
import '../../../domain/usecases/get_onboarding_pages_usecase.dart';
import 'onboarding_buttons.dart';
import 'onboarding_dots_indicator.dart';
import 'onboarding_view_body.dart';
import 'onboarding_view_placeholder.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.isLastPage,
    required this.isDarkPage,
    this.skipToLast,
    this.goNext,
    this.onGetStarted,
    this.pageController,
    this.onPageChanged,
    required this.currentIndex,
    required this.dotsActiveColor,
    required this.dotsInactiveColor,
  });

  final bool isLastPage;
  final bool isDarkPage;
  final VoidCallback? skipToLast;
  final VoidCallback? goNext;
  final VoidCallback? onGetStarted;
  final PageController? pageController;
  final ValueChanged<int>? onPageChanged;
  final int currentIndex;
  final Color dotsActiveColor;
  final Color dotsInactiveColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top row (Skip)
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: isLastPage ? null : skipToLast,
            child: Text(
              AppStrings.buttonSkip,
              style: context.medium.copyWith(
                color: isDarkPage ? ColorManager.backgroundPrimaryColor : null,
              ),
            ),
          ),
        ),

        const Spacer(flex: 1),

        // Page content (image + title + subtitle)
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.45,
          child: PageView.builder(
            controller: pageController,
            itemCount: kOnboardingPagesCount,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return OnboardingPagePlaceholder(
                index: index,
                onboardingPageEntity: const GetOnboardingPagesUseCase()
                    .call()[index],
              );
            },
          ),
        ),

        context.sizedBoxHeight_10,

        // Dots
        OnboardingDotsIndicator(
          count: kOnboardingPagesCount,
          currentIndex: currentIndex,
          activeColor: dotsActiveColor,
          inactiveColor: dotsInactiveColor,
        ),

        context.sizedBoxHeight_10,

        // Button
        OnboardingButtons(
          isLastPage: isLastPage,
          goNext: goNext,
          onGetStarted: onGetStarted,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
