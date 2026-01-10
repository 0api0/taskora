import 'package:taskora/features/splash_onboarding/domain/repositories/onboarding_repository.dart';

class CompleteOnboardingUseCase {
  final OnboardingRepository _repo;

  CompleteOnboardingUseCase(this._repo);

  Future<void> call() {
    return _repo.setOnboardingCompleted();
  }
}
