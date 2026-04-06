import 'package:flutter/foundation.dart';

import '../../../domain/entities/code_verification_entity.dart';
import '../../../domain/entities/forgot_password_verification_entity.dart';

enum PasswordRecoveryStatus {
  initial,
  loading,
  success,
  failure,
  networkFailure,
}

@immutable
class PasswordRecoveryState {
  const PasswordRecoveryState({
    this.status = PasswordRecoveryStatus.initial,
    this.message,
    this.forgotPasswordVerification,
    this.codeVerification,
  });

  final PasswordRecoveryStatus status;
  final String? message;
  final ForgotPasswordVerificationEntity? forgotPasswordVerification;
  final CodeVerificationEntity? codeVerification;

  PasswordRecoveryState copyWith({
    PasswordRecoveryStatus? status,
    String? message,
    ForgotPasswordVerificationEntity? forgotPasswordVerificationEntity,
    CodeVerificationEntity? codeVerificationEntity,
    bool clearMessage = false,
    bool clearForgotPasswordVerification = false,
    bool clearCodeVerification = false,
  }) {
    return PasswordRecoveryState(
      status: status ?? this.status,
      message: clearMessage ? null : (message ?? this.message),
      forgotPasswordVerification: clearForgotPasswordVerification
          ? null
          : (forgotPasswordVerificationEntity ?? forgotPasswordVerification),
      codeVerification: clearCodeVerification
          ? null
          : (codeVerificationEntity ?? codeVerification),
    );
  }
}
