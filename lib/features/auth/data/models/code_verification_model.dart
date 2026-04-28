import '../../domain/entities/code_verification_entity.dart';
import '../core/methode_helper/parse_num.dart';

class CodeVerificationModel extends CodeVerificationEntity {
  const CodeVerificationModel({required super.code});

  factory CodeVerificationModel.fromResponse(Map<String, dynamic> json) {
    final Map<String, dynamic> data =
        json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};

    return CodeVerificationModel(code: parseNum(data['code']));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'code': code};
  }
}
