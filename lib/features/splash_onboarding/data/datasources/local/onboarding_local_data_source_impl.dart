import 'package:taskora/core/services/local/storage_keys.dart';
import 'package:taskora/features/splash_onboarding/data/datasources/local/onboarding_local_data_source.dart';

import '../../../../../core/services/local/shared_pref_service.dart';

class OnboardingLocalDataSourceImpl extends OnboardingLocalDataSource {
  final SharedPrefService _prefs;

  OnboardingLocalDataSourceImpl(this._prefs);

  @override
  Future<bool> isOnboardingCompleted() async {
    return _prefs.getBool(StorageKeys.onboardingCompleted, defaultValue: false);
  }

  @override
  Future<void> setOnboardingCompleted() {
    return _prefs.setBool(StorageKeys.onboardingCompleted, true);
  }
}
