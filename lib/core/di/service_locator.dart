import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/splash_onboarding/data/datasources/local/onboarding_local_data_source.dart';
import '../../features/splash_onboarding/data/datasources/local/onboarding_local_data_source_impl.dart';
import '../../features/splash_onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../features/splash_onboarding/domain/repositories/onboarding_repository.dart';
import '../services/local/shared_pref_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final prefs = await SharedPreferences.getInstance();

  // *************** sl - SharedPreferences *********************
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerSingleton<SharedPrefService>(
    SharedPrefService(sl.get<SharedPreferences>()),
  );

  // *************** sl - Onboarding *********************

  // -- local data --
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sl.get<SharedPrefService>()),
  );

  // -- repo --
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl.get<OnboardingLocalDataSource>()),
  );
}
