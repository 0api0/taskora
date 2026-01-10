import '../../domain/entities/onboarding_page_entity.dart';

abstract class SplashOnboardingState {}

class SplashOnboardingInitial extends SplashOnboardingState {}

class SplashOnboardingLoading extends SplashOnboardingState {}

class ShowOnboarding extends SplashOnboardingState {
  final List<OnboardingPageEntity> pages;
  ShowOnboarding(this.pages);
}

class NavigateToHome extends SplashOnboardingState {}
