import '../../domain/entities/onboarding_page_entity.dart';

abstract class SplashOnboardingState {}

class SplashOnboardingInitial extends SplashOnboardingState {}

class SplashOnboardingLoading extends SplashOnboardingState {}

class ShowOnboarding extends SplashOnboardingState {}

class NavigateToHome extends SplashOnboardingState {}
