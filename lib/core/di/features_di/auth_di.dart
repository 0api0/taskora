import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taskora/features/auth/data/repositories/auth_session_store_impl.dart';
import 'package:taskora/features/auth/data/repositories/auth_repository_impl.dart';
import '../../../features/auth/data/datasources/local/auth_local_data_source.dart';
import '../../../features/auth/data/datasources/local/auth_local_data_source_impl.dart';
import '../../../features/auth/data/datasources/remote/auth_remote_data_source.dart';
import '../../../features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import '../../../features/auth/domain/repositories/auth_repository.dart';
import '../../../features/auth/domain/repositories/auth_session_manager_store.dart';
import '../../../features/auth/domain/usecases/check_reset_code_use_case.dart';
import '../../../features/auth/domain/usecases/forgot_password_use_case.dart';
import '../../../features/auth/domain/usecases/get_current_user_use_case.dart';
import '../../../features/auth/domain/usecases/has_session_use_case.dart';
import '../../../features/auth/domain/usecases/login_use_case.dart';
import '../../../features/auth/domain/usecases/register_usecase.dart';
import '../../../features/auth/domain/usecases/reset_password_use_case.dart';
import '../../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import '../../services/local/shared_pref_service.dart';
import '../../services/remote/interceptors/auth_interceptor.dart';
import '../../services/remote/remote_service.dart';

void setUpAuthDI(GetIt sl) {
  // -- local data --
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl<SharedPrefService>()),
  );

  // -- auth session store --
  sl.registerLazySingleton<AuthSessionStore>(
    () => AuthSessionStoreImpl(sl<AuthLocalDataSource>()),
  );

  // -- auth interceptor --
  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl<AuthSessionStore>(), sl<AuthLocalDataSource>()),
  );

  if (!sl<Dio>().interceptors.any(
    (interceptor) => interceptor is AuthInterceptor,
  )) {
    sl<Dio>().interceptors.add(sl<AuthInterceptor>());
  }

  // -- remote data --
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<RemoteService>()),
  );

  // -- repo --
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl<AuthRemoteDataSource>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
      authSessionStore: sl<AuthSessionStore>(),
    ),
  );

  // -- use cases --
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<CheckResetCodeUseCase>(
    () => CheckResetCodeUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<HasSessionUseCase>(
    () => HasSessionUseCase(sl<AuthSessionStore>()),
  );

  // -- blocs --
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      getCurrentUserUseCase: sl<GetCurrentUserUseCase>(),
    ),
  );

  sl.registerFactory<PasswordRecoveryBloc>(
    () => PasswordRecoveryBloc(
      forgotPasswordUseCase: sl<ForgotPasswordUseCase>(),
      checkResetCodeUseCase: sl<CheckResetCodeUseCase>(),
      resetPasswordUseCase: sl<ResetPasswordUseCase>(),
    ),
  );
}
