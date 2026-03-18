import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../params/login_params.dart';
import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthSessionEntity, LoginParams> {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, AuthSessionEntity>> call(LoginParams params) {
    return _authRepository.login(params);
  }
}
