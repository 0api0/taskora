import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.watchCost,
  });

  final String name;
  final String email;
  final String username;
  final String password;
  final String watchCost;

  @override
  List<Object?> get props => [name, email, username, password, watchCost];
}
