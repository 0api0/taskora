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

enum PasswordRecoveryStep { enterEmail, enterCode, enterNewPassword, completed }

@immutable
class PasswordRecoveryState {
  const PasswordRecoveryState({
    this.status = PasswordRecoveryStatus.initial,
    this.message,
    this.forgotPasswordVerification,
    this.codeVerification,
    this.step = PasswordRecoveryStep.enterEmail,
  });

  final PasswordRecoveryStatus status;
  final PasswordRecoveryStep step;
  final String? message;
  final ForgotPasswordVerificationEntity? forgotPasswordVerification;
  final CodeVerificationEntity? codeVerification;

  PasswordRecoveryState copyWith({
    PasswordRecoveryStatus? status,
    PasswordRecoveryStep? step,
    String? message,
    ForgotPasswordVerificationEntity? forgotPasswordVerificationEntity,
    CodeVerificationEntity? codeVerificationEntity,
    bool clearMessage = false,
    bool clearForgotPasswordVerification = false,
    bool clearCodeVerification = false,
  }) {
    return PasswordRecoveryState(
      status: status ?? this.status,
      step: step ?? this.step,
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
