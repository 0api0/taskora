import 'package:taskora/features/auth/domain/entities/user_entity.dart';

class AuthSessionEntity {
  const AuthSessionEntity({required this.accessToken, required this.user});

  final String accessToken;
  final UserEntity user;
}
