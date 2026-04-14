import 'package:flutter/foundation.dart';

import '../../../params/check_reset_code_params.dart';
import '../../../params/forgot_password_params.dart';
import '../../../params/reset_password_params.dart';

@immutable
sealed class PasswordRecoveryEvent {
  const PasswordRecoveryEvent();
}

final class ForgotPasswordRequested extends PasswordRecoveryEvent {
  const ForgotPasswordRequested(this.params);

  final ForgotPasswordParams params;
}

final class CheckResetCodeRequested extends PasswordRecoveryEvent {
  const CheckResetCodeRequested(this.params);

  final CheckResetCodeParams params;
}

final class ResetPasswordRequested extends PasswordRecoveryEvent {
  const ResetPasswordRequested(this.params);

  final ResetPasswordParams params;
}

final class ResetPasswordRecoveryStateRequested extends PasswordRecoveryEvent {
  const ResetPasswordRecoveryStateRequested();
}

final class ClearPasswordRecoveryStatusRequested extends PasswordRecoveryEvent {
  const ClearPasswordRecoveryStatusRequested();
}
