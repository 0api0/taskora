import '../../domain/entities/auth_session_entity.dart';
import 'user_model.dart';

class AuthSessionModel extends AuthSessionEntity {
  const AuthSessionModel({required super.accessToken, required super.user});

  factory AuthSessionModel.fromLoginResponse(Map<String, dynamic> json) {
    return AuthSessionModel(
      accessToken: json['token'] as String? ?? '',
      user: UserModel(email: json['email'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': accessToken,
      'email': user.email,
      'name': user.name,
      'username': user.username,
    };
  }
}
