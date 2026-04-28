import '../../domain/entities/forgot_password_verification_entity.dart';
import '../core/methode_helper/parse_num.dart';

class ForgotPasswordVerificationModel extends ForgotPasswordVerificationEntity {
  const ForgotPasswordVerificationModel({
    required super.email,
    required super.code,
  });

  factory ForgotPasswordVerificationModel.fromResponse(
    Map<String, dynamic> json,
  ) {
    final Map<String, dynamic> user =
        json['user'] as Map<String, dynamic>? ?? <String, dynamic>{};

    return ForgotPasswordVerificationModel(
      email: user['email'] as String? ?? '',
      code: parseNum(user['code']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'email': email, 'code': code};
  }
}
