abstract class OnboardingRepository {
  /// true = user already completed onboarding
  Future<bool> isOnboardingCompleted();

  /// saves onboarding as completed
  Future<void> setOnboardingCompleted();
}
