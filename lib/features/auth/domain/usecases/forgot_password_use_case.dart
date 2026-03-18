import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../params/forgot_password_params.dart';
import '../entities/forgot_password_verification_entity.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase
    implements UseCase<ForgotPasswordVerificationEntity, ForgotPasswordParams> {
  const ForgotPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, ForgotPasswordVerificationEntity>> call(
    ForgotPasswordParams params,
  ) {
    return _authRepository.forgotPassword(params);
  }
}
