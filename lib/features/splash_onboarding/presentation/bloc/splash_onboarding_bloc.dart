import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/splash_onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:taskora/features/splash_onboarding/domain/usecases/resolve_startup_destination_use_case.dart';
import 'package:taskora/features/splash_onboarding/presentation/bloc/splash_onboarding_event.dart';
import 'package:taskora/features/splash_onboarding/presentation/bloc/splash_onboarding_state.dart';

class SplashOnboardingBloc
    extends Bloc<SplashOnboardingEvent, SplashOnboardingState> {
  SplashOnboardingBloc(
    this._resolveStartupDestinationUseCase,
    this._completeOnboardingUseCase,
  ) : super(SplashOnboardingInitial()) {
    on<AppStartedEvent>(_onAppStarted);
    on<OnboardingCompletedEvent>(_onOnboardingCompleted);
  }

  final ResolveStartupDestinationUseCase _resolveStartupDestinationUseCase;
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  Future<void> _onAppStarted(
    AppStartedEvent event,
    Emitter<SplashOnboardingState> emit,
  ) async {
    emit(SplashOnboardingLoading());

    final StartupDestination destination =
        await _resolveStartupDestinationUseCase();

    switch (destination) {
      case StartupDestination.onboarding:
        emit(ShowOnboarding());
        break;
      case StartupDestination.login:
        emit(NavigateToLogin());
        break;
      case StartupDestination.home:
        emit(NavigateToHome());
        break;
    }
  }

  Future<void> _onOnboardingCompleted(
    OnboardingCompletedEvent event,
    Emitter<SplashOnboardingState> emit,
  ) async {
    emit(SplashOnboardingLoading());

    await _completeOnboardingUseCase();

    emit(NavigateToLogin());
  }
}
