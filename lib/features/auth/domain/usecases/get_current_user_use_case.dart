import 'package:dartz/dartz.dart';
import 'package:taskora/features/auth/domain/entities/user_full_data_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase implements NoParamsUseCase<UserFullDataEntity> {
  const GetCurrentUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserFullDataEntity>> call() {
    return _authRepository.getCurrentUser();
  }
}
