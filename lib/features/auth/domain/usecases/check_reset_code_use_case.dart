import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../params/check_reset_code_params.dart';
import '../entities/code_verification_entity.dart';
import '../repositories/auth_repository.dart';

class CheckResetCodeUseCase
    implements UseCase<CodeVerificationEntity, CheckResetCodeParams> {
  const CheckResetCodeUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, CodeVerificationEntity>> call(
    CheckResetCodeParams params,
  ) {
    return _authRepository.checkResetCode(params);
  }
}
