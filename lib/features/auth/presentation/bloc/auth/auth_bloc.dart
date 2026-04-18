import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/get_current_user_use_case.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<GetCurrentUserRequested>(_onGetCurrentUserRequested);
    on<ResetAuthStateRequested>(_onResetAuthStateRequested);
  }

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  int countLog = 0;

  // ********************** on events ********************************
  Future<void> _onLoginRequested(event, emit) async {
    if (countLog == 2) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          message: 'Your attempts are over... try later',
          clearValidationErrors: true,
          clearSession: true,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        clearMessage: true,
        clearValidationErrors: true,
      ),
    );

    final result = await _loginUseCase(event.params);

    result.fold((failure) => emit(_mapFailureToState(failure)), (session) {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          session: session,
          message: 'Logged in successfully.',
          clearValidationErrors: true,
        ),
      );
    });
  }

  Future<void> _onRegisterRequested(event, emit) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        clearMessage: true,
        clearValidationErrors: true,
      ),
    );

    final result = await _registerUseCase(event.params);

    result.fold((failure) => emit(_mapFailureToState(failure)), (_) {
      emit(
        state.copyWith(
          status: AuthStatus.success,
          message: 'Account created successfully.',
          clearValidationErrors: true,
        ),
      );
    });
  }

  Future<void> _onGetCurrentUserRequested(event, emit) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        clearMessage: true,
        clearValidationErrors: true,
      ),
    );

    final result = await _getCurrentUserUseCase();

    result.fold((failure) => emit(_mapFailureToState(failure)), (userFullData) {
      emit(
        state.copyWith(
          status: AuthStatus.success,
          userFullData: userFullData,
          clearValidationErrors: true,
        ),
      );
    });
  }

  void _onResetAuthStateRequested(event, emit) {
    emit(const AuthState());
  }

  AuthState _mapFailureToState(Failure failure) {
    if (failure is ValidationFailure) {
      return state.copyWith(
        status: AuthStatus.failure,
        message: failure.message,
        validationErrors: failure.errors,
      );
    }
    if (failure is NetworkFailure) {
      return state.copyWith(
        status: AuthStatus.networkFailure,
        message: failure.message,
        clearValidationErrors: true,
      );
    }
    if (failure is UnauthorizedFailure) {
      countLog++;
      return state.copyWith(
        status: AuthStatus.unauthenticated,
        message: failure.message,
        clearSession: true,
      );
    }

    return state.copyWith(
      status: AuthStatus.failure,
      message: failure.message,
      clearValidationErrors: true,
    );
  }
}
