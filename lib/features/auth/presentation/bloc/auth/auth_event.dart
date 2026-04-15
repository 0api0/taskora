import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../params/login_params.dart';
import '../../../params/register_params.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => const [];
}

final class LoginRequested extends AuthEvent {
  const LoginRequested(this.params);

  final LoginParams params;

  @override
  List<Object?> get props => [params];
}

final class RegisterRequested extends AuthEvent {
  const RegisterRequested(this.params);

  final RegisterParams params;

  @override
  List<Object?> get props => [params];
}

final class GetCurrentUserRequested extends AuthEvent {
  const GetCurrentUserRequested();
}

final class ResetAuthStateRequested extends AuthEvent {
  const ResetAuthStateRequested();
}
