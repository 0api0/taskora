import '../repositories/onboarding_repository.dart';

class CheckOnboardingStatusUseCase {
  final OnboardingRepository _repo;

  CheckOnboardingStatusUseCase(this._repo);

  Future<bool> call() {
    return _repo.isOnboardingCompleted();
  }
}
