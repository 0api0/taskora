import 'package:flutter/material.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/onboarding_widgets/onboarding_view_placeholder.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return OnboardingPagePlaceholder(index: index);
      },
    );
  }
}
