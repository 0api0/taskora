import 'package:get_it/get_it.dart';

import '../../../features/splash_onboarding/data/datasources/local/onboarding_local_data_source.dart';
import '../../../features/splash_onboarding/data/datasources/local/onboarding_local_data_source_impl.dart';
import '../../../features/splash_onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../../features/splash_onboarding/domain/repositories/onboarding_repository.dart';
import '../../../features/splash_onboarding/domain/usecases/check_onboarding_status_usecase.dart';
import '../../../features/splash_onboarding/domain/usecases/complete_onboarding_usecase.dart';
import '../../../features/splash_onboarding/domain/usecases/get_onboarding_pages_usecase.dart';
import '../../../features/splash_onboarding/presentation/bloc/splash_onboarding_bloc.dart';
import '../../services/local/shared_pref_service.dart';

void setupSplashOnboardingDI(GetIt sl) {
  // -- local data --
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sl.get<SharedPrefService>()),
  );

  // -- repo --
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl.get<OnboardingLocalDataSource>()),
  );

  // -- use cases --
  sl.registerLazySingleton(
    () => CheckOnboardingStatusUseCase(sl<OnboardingRepository>()),
  );

  sl.registerLazySingleton(
    () => CompleteOnboardingUseCase(sl<OnboardingRepository>()),
  );

  sl.registerLazySingleton(() => const GetOnboardingPagesUseCase());

  // -- bloc --
  sl.registerFactory(
    () => SplashOnboardingBloc(
      sl<CheckOnboardingStatusUseCase>(),
      sl<CompleteOnboardingUseCase>(),
      sl<GetOnboardingPagesUseCase>(),
    ),
  );
}
