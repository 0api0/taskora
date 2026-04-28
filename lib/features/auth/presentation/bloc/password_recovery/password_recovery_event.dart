import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../params/check_reset_code_params.dart';
import '../../../params/forgot_password_params.dart';
import '../../../params/reset_password_params.dart';

@immutable
sealed class PasswordRecoveryEvent extends Equatable {
  const PasswordRecoveryEvent();
  @override
  List<Object?> get props => const [];
}

final class ForgotPasswordRequested extends PasswordRecoveryEvent {
  const ForgotPasswordRequested(this.params);

  final ForgotPasswordParams params;
  @override
  List<Object?> get props => [params];
}

final class CheckResetCodeRequested extends PasswordRecoveryEvent {
  const CheckResetCodeRequested(this.params);

  final CheckResetCodeParams params;
  @override
  List<Object?> get props => [params];
}

final class ResetPasswordRequested extends PasswordRecoveryEvent {
  const ResetPasswordRequested(this.params);

  final ResetPasswordParams params;
  @override
  List<Object?> get props => [params];
}

final class ResetPasswordRecoveryStateRequested extends PasswordRecoveryEvent {
  const ResetPasswordRecoveryStateRequested();
}

final class ClearPasswordRecoveryStatusRequested extends PasswordRecoveryEvent {
  const ClearPasswordRecoveryStatusRequested();
}
