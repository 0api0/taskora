import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({required this.email, required this.newPassword});

  final String email;
  final String newPassword;

  @override
  List<Object?> get props => [email, newPassword];
}
