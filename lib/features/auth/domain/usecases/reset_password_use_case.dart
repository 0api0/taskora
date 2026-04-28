import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../params/reset_password_params.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<Unit, ResetPasswordParams> {
  const ResetPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, Unit>> call(ResetPasswordParams params) {
    return _authRepository.resetPassword(params);
  }
}
