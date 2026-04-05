import 'package:get_it/get_it.dart';

import '../../../features/auth/domain/usecases/has_session_use_case.dart';
import '../../../features/splash_onboarding/data/datasources/local/onboarding_local_data_source.dart';
import '../../../features/splash_onboarding/data/datasources/local/onboarding_local_data_source_impl.dart';
import '../../../features/splash_onboarding/data/repositories/onboarding_repository_impl.dart';
import '../../../features/splash_onboarding/domain/repositories/onboarding_repository.dart';
import '../../../features/splash_onboarding/domain/usecases/check_onboarding_status_usecase.dart';
import '../../../features/splash_onboarding/domain/usecases/complete_onboarding_usecase.dart';
import '../../../features/splash_onboarding/domain/usecases/get_onboarding_pages_usecase.dart';
import '../../../features/splash_onboarding/domain/usecases/resolve_startup_destination_use_case.dart';
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
  sl.registerLazySingleton<CheckOnboardingStatusUseCase>(
    () => CheckOnboardingStatusUseCase(sl<OnboardingRepository>()),
  );

  sl.registerLazySingleton<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCase(sl<OnboardingRepository>()),
  );

  sl.registerLazySingleton<GetOnboardingPagesUseCase>(
    () => const GetOnboardingPagesUseCase(),
  );
  sl.registerLazySingleton<ResolveStartupDestinationUseCase>(
    () => ResolveStartupDestinationUseCase(
      sl<CheckOnboardingStatusUseCase>(),
      sl<HasSessionUseCase>(),
    ),
  );

  // -- bloc --
  sl.registerFactory<SplashOnboardingBloc>(
    () => SplashOnboardingBloc(
      sl<ResolveStartupDestinationUseCase>(),
      sl<CompleteOnboardingUseCase>(),
    ),
  );
}
