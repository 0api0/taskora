import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/splash_onboarding/presentation/bloc/splash_onboarding_event.dart';
import 'package:taskora/features/splash_onboarding/presentation/bloc/splash_onboarding_state.dart';

import '../../domain/usecases/check_onboarding_status_usecase.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';
import '../../domain/usecases/get_onboarding_pages_usecase.dart';

class SplashOnboardingBloc
    extends Bloc<SplashOnboardingEvent, SplashOnboardingState> {
  final CheckOnboardingStatusUseCase _checkStatus;
  final CompleteOnboardingUseCase _completeOnboarding;
  final GetOnboardingPagesUseCase _getPages;

  SplashOnboardingBloc(
    this._checkStatus,
    this._completeOnboarding,
    this._getPages,
  ) : super(SplashOnboardingInitial()) {
    on<AppStartedEvent>(_onAppStarted);
    on<OnboardingCompletedEvent>(_onOnboardingCompleted);
  }

  // on app start ---
  Future<void> _onAppStarted(
    AppStartedEvent event,
    Emitter<SplashOnboardingState> emit,
  ) async {
    emit(SplashOnboardingLoading());

    final completed = await _checkStatus();

    if (completed) {
      emit(NavigateToHome());
    } else {
      final pages = _getPages();
      emit(ShowOnboarding(pages));
    }
  }

  // if onboarding completed (on tap => get started)
  Future<void> _onOnboardingCompleted(
    OnboardingCompletedEvent event,
    Emitter<SplashOnboardingState> emit,
  ) async {
    emit(SplashOnboardingLoading());
    await _completeOnboarding();
    emit(NavigateToHome());
  }
}
