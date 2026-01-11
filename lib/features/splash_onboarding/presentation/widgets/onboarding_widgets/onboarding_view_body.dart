import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/onboarding_widgets/onboarding_dots_indicator.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/onboarding_widgets/onboarding_view_placeholder.dart';

import 'onboarding_buttons.dart';

const int kOnboardingPagesCount = 3;

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController _pageController;
  late int _currentIndex = 0;

  bool get _isLastPage => _currentIndex == kOnboardingPagesCount - 1;

  bool get _isDarkPage => _currentIndex == 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onPageChanged(int index) => setState(() => _currentIndex = index);

  void _goNext() {
    if (_isLastPage) return;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  void _skipToLast() {
    _pageController.animateToPage(
      kOnboardingPagesCount - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void _onGetStarted() {
    // TODO: Bloc
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _isDarkPage
        ? ColorManager.primaryColorApp
        : ColorManager.backgroundPrimaryColor;

    final dotsActiveColor = _isDarkPage
        ? ColorManager.backgroundPrimaryColor
        : ColorManager.primaryColorApp;
    final dotsInactiveColor = _isDarkPage
        ? ColorManager.backgroundPrimaryColor.withValues(alpha: 0.25)
        : ColorManager.primaryColorApp.withValues(alpha: 0.25);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: bgColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Top row (Skip)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _isLastPage ? null : _skipToLast,
                  child: Text(
                    AppStrings.buttonSkip,
                    style: context.medium.copyWith(
                      color: _isDarkPage
                          ? ColorManager.backgroundPrimaryColor
                          : null,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 2),

              // Page content (image + title + subtitle)
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.45,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: kOnboardingPagesCount,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return OnboardingPagePlaceholder(index: index);
                  },
                ),
              ),

              const SizedBox(height: 18),

              // Dots
              OnboardingDotsIndicator(
                count: kOnboardingPagesCount,
                currentIndex: _currentIndex,
                activeColor: dotsActiveColor,
                inactiveColor: dotsInactiveColor,
              ),

              const SizedBox(height: 18),

              // Button
              OnboardingButtons(
                isLastPage: _isLastPage,
                goNext: _goNext,
                onGetStarted: _onGetStarted,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
