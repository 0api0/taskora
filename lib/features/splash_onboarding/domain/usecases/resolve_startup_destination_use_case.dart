import '../../../auth/domain/usecases/has_session_use_case.dart';
import 'check_onboarding_status_usecase.dart';

enum StartupDestination { onboarding, login, home }

class ResolveStartupDestinationUseCase {
  ResolveStartupDestinationUseCase(
    this._checkOnboardingStatusUseCase,
    this._hasSessionUseCase,
  );

  final CheckOnboardingStatusUseCase _checkOnboardingStatusUseCase;
  final HasSessionUseCase _hasSessionUseCase;

  Future<StartupDestination> call() async {
    final bool onboardingCompleted = await _checkOnboardingStatusUseCase();

    if (!onboardingCompleted) {
      return StartupDestination.onboarding;
    }

    final bool hasSession = _hasSessionUseCase();

    if (hasSession) {
      return StartupDestination.home;
    }

    return StartupDestination.login;
  }
}
