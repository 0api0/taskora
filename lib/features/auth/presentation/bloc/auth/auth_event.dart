import 'package:flutter/foundation.dart';

import '../../../params/login_params.dart';
import '../../../params/register_params.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class LoginRequested extends AuthEvent {
  const LoginRequested(this.params);

  final LoginParams params;
}

final class RegisterRequested extends AuthEvent {
  const RegisterRequested(this.params);

  final RegisterParams params;
}

final class GetCurrentUserRequested extends AuthEvent {
  const GetCurrentUserRequested();
}

final class ResetAuthStateRequested extends AuthEvent {
  const ResetAuthStateRequested();
}
