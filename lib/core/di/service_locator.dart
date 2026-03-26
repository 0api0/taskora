import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskora/core/di/core/remote_core_di.dart';
import 'package:taskora/core/di/features_di/auth_di.dart';
import '../services/local/shared_pref_service.dart';
import 'features_di/splash_onboarding_di.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final prefs = await SharedPreferences.getInstance();

  // *************** sl - SharedPreferences *********************
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerSingleton<SharedPrefService>(
    SharedPrefService(sl.get<SharedPreferences>()),
  );

  // *************** sl - Onboarding *********************
  setupSplashOnboardingDI(sl);
  setUpRemoteCoreDi(sl);
  setUpAuthDI(sl);
}
