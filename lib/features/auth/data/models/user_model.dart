import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.email, super.name, super.username});

  factory UserModel.fromSignupResponse(Map<String, dynamic> json) {
    final Map<String, dynamic> data =
        json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};

    return UserModel(
      name: data['name'] as String?,
      email: data['email'] as String? ?? '',
      username: data['username'] as String?,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      email: json['email'] as String? ?? '',
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'username': username,
    };
  }
}
