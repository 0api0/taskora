import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import '../../bloc/splash_onboarding_bloc.dart';
import '../../bloc/splash_onboarding_event.dart';
import 'onboarding_content.dart';

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
  static const List<Color> _pageBgColors = [
    ColorManager.backgroundPrimaryColor,
    Color(0xFFEFF1FF),
    ColorManager.primaryColorApp,
  ];

  Color get bgColor => _pageBgColors[_currentIndex];

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
    context.read<SplashOnboardingBloc>().add(OnboardingCompletedEvent());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: OnboardingContent(
            isLastPage: _isLastPage,
            currentIndex: _currentIndex,
            dotsActiveColor: dotsActiveColor,
            dotsInactiveColor: dotsInactiveColor,
            isDarkPage: _isDarkPage,
            onGetStarted: _onGetStarted,
            goNext: _goNext,
            onPageChanged: _onPageChanged,
            pageController: _pageController,
            skipToLast: _skipToLast,
          ),
        ),
      ),
    );
  }
}
