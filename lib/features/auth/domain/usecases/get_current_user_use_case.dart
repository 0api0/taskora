import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase implements NoParamsUseCase<UserEntity> {
  const GetCurrentUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserEntity>> call() {
    return _authRepository.getCurrentUser();
  }
}
