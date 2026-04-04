import 'package:flutter/foundation.dart';

import '../../../domain/entities/auth_session_entity.dart';
import '../../../domain/entities/user_full_data_entity.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  authenticated,
  unauthenticated,
  failure,
  networkFailure,
}

@immutable
class AuthState {
  const AuthState({
    this.status = AuthStatus.initial,
    this.message,
    this.validationErrors = const <String>[],
    this.session,
    this.userFullData,
  });

  final AuthStatus status;
  final String? message;
  final List<String> validationErrors;
  final AuthSessionEntity? session;
  final UserFullDataEntity? userFullData;

  AuthState copyWith({
    AuthStatus? status,
    String? message,
    List<String>? validationErrors,
    AuthSessionEntity? session,
    UserFullDataEntity? userFullData,
    bool clearMessage = false,
    bool clearValidationErrors = false,
    bool clearSession = false,
    bool clearUserFullData = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      message: clearMessage ? null : message ?? this.message,
      validationErrors: clearValidationErrors
          ? const <String>[]
          : validationErrors ?? this.validationErrors,
      session: clearSession ? null : session ?? this.session,
      userFullData: clearUserFullData
          ? null
          : userFullData ?? this.userFullData,
    );
  }
}
