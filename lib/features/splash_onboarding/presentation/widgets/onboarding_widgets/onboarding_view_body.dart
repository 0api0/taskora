import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/onboarding_widgets/onboarding_view_placeholder.dart';

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

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

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
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: kOnboardingPagesCount,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            return OnboardingPagePlaceholder(index: index);
          },
        ),
        // Skip (top-right)
        Positioned(
          top: 45,
          right: 30,
          child: TextButton(
            onPressed: _isLastPage ? null : _skipToLast,
            child: Text(AppStrings.buttonSkip, style: context.medium),
          ),
        ),
        // Bottom button
        Positioned(
          left: 16,
          right: 16,
          bottom: 24,
          child: SizedBox(
            height: 48,
            child: _isLastPage
                ? ElevatedButton(
                    onPressed: _onGetStarted,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.backgroundPrimaryColor,
                    ),
                    child: const Text(
                      AppStrings.buttonGetStarted,
                      style: TextStyle(color: ColorManager.primaryColorApp),
                    ),
                  )
                : ElevatedButton(
                    onPressed: _goNext,
                    child: const Text(AppStrings.buttonNext),
                  ),
          ),
        ),
      ],
    );
  }
}
