import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../../params/register_params.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<UserEntity, RegisterParams> {
  const RegisterUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) {
    return _authRepository.register(params);
  }
}
