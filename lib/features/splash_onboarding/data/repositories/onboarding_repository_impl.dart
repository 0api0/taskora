import 'package:taskora/features/splash_onboarding/data/datasources/local/onboarding_local_data_source.dart';
import 'package:taskora/features/splash_onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  final OnboardingLocalDataSource _localDataSource;

  OnboardingRepositoryImpl(this._localDataSource);

  @override
  Future<bool> isOnboardingCompleted() {
    return _localDataSource.isOnboardingCompleted();
  }

  @override
  Future<void> setOnboardingCompleted() {
    return _localDataSource.setOnboardingCompleted();
  }
}
