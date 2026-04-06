import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/check_reset_code_use_case.dart';
import '../../../domain/usecases/forgot_password_use_case.dart';
import '../../../domain/usecases/reset_password_use_case.dart';
import 'password_recovery_event.dart';
import 'password_recovery_state.dart';

class PasswordRecoveryBloc
    extends Bloc<PasswordRecoveryEvent, PasswordRecoveryState> {
  PasswordRecoveryBloc({
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required CheckResetCodeUseCase checkResetCodeUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  }) : _forgotPasswordUseCase = forgotPasswordUseCase,
       _checkResetCodeUseCase = checkResetCodeUseCase,
       _resetPasswordUseCase = resetPasswordUseCase,
       super(const PasswordRecoveryState()) {
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<CheckResetCodeRequested>(_onCheckResetCodeRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
    on<ResetPasswordRecoveryStateRequested>(
      _onResetPasswordRecoveryStateRequested,
    );
  }

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final CheckResetCodeUseCase _checkResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> _onForgotPasswordRequested(event, emit) async {
    emit(
      state.copyWith(
        status: PasswordRecoveryStatus.loading,
        clearMessage: true,
      ),
    );

    final result = await _forgotPasswordUseCase(event.params);

    result.fold((failure) => emit(_mapFailureToState(failure)), (verification) {
      emit(
        state.copyWith(
          status: PasswordRecoveryStatus.success,
          forgotPasswordVerificationEntity: verification,
          message: 'User verified successfully',
          clearCodeVerification: true,
        ),
      );
    });
  }

  Future<void> _onCheckResetCodeRequested(event, emit) async {
    emit(
      state.copyWith(
        status: PasswordRecoveryStatus.loading,
        clearMessage: true,
      ),
    );

    final result = await _checkResetCodeUseCase(event.params);

    result.fold((failure) => emit(_mapFailureToState(failure)), (
      codeVerification,
    ) {
      emit(
        state.copyWith(
          status: PasswordRecoveryStatus.success,
          codeVerificationEntity: codeVerification,
          message: 'Code verified successfully.',
        ),
      );
    });
  }

  Future<void> _onResetPasswordRequested(event, emit) async {
    emit(
      state.copyWith(
        status: PasswordRecoveryStatus.loading,
        clearMessage: true,
      ),
    );

    final result = await _resetPasswordUseCase(event.params);

    result.fold((failure) => emit(_mapFailureToState(failure)), (_) {
      emit(
        state.copyWith(
          status: PasswordRecoveryStatus.success,
          message: 'Password reset successfully.',
          clearCodeVerification: true,
        ),
      );
    });
  }

  void _onResetPasswordRecoveryStateRequested(event, emit) {
    emit(const PasswordRecoveryState());
  }

  PasswordRecoveryState _mapFailureToState(Failure failure) {
    if (failure is NetworkFailure) {
      return state.copyWith(
        status: PasswordRecoveryStatus.networkFailure,
        message: failure.message,
      );
    }
    return state.copyWith(
      status: PasswordRecoveryStatus.failure,
      message: failure.message,
    );
  }
}
