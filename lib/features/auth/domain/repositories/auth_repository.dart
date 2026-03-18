import 'package:dartz/dartz.dart';
import 'package:taskora/features/auth/domain/entities/user_full_data_entity.dart';
import 'package:taskora/features/auth/params/check_reset_code_params.dart';
import 'package:taskora/features/auth/params/forgot_password_params.dart';
import 'package:taskora/features/auth/params/login_params.dart';
import 'package:taskora/features/auth/params/register_params.dart';
import 'package:taskora/features/auth/params/reset_password_params.dart';

import '../../../../core/errors/failure.dart';
import '../entities/auth_session_entity.dart';
import '../entities/code_verification_entity.dart';
import '../entities/forgot_password_verification_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterParams params);

  Future<Either<Failure, AuthSessionEntity>> login(LoginParams params);

  Future<Either<Failure, ForgotPasswordVerificationEntity>> forgotPassword(
    ForgotPasswordParams params,
  );

  Future<Either<Failure, CodeVerificationEntity>> checkResetCode(
    CheckResetCodeParams params,
  );

  Future<Either<Failure, Unit>> resetPassword(ResetPasswordParams params);

  Future<Either<Failure, UserFullDataEntity>> getCurrentUser();
}
