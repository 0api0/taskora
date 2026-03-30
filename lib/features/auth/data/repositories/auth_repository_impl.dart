import 'package:dartz/dartz.dart';
import 'package:taskora/core/errors/failure.dart';
import 'package:taskora/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:taskora/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:taskora/features/auth/domain/entities/auth_session_entity.dart';
import 'package:taskora/features/auth/domain/entities/code_verification_entity.dart';
import 'package:taskora/features/auth/domain/entities/forgot_password_verification_entity.dart';
import 'package:taskora/features/auth/domain/entities/user_entity.dart';
import 'package:taskora/features/auth/domain/entities/user_full_data_entity.dart';
import 'package:taskora/features/auth/domain/repositories/auth_repository.dart';
import 'package:taskora/features/auth/params/check_reset_code_params.dart';
import 'package:taskora/features/auth/params/forgot_password_params.dart';
import 'package:taskora/features/auth/params/login_params.dart';
import 'package:taskora/features/auth/params/register_params.dart';
import 'package:taskora/features/auth/params/reset_password_params.dart';

import '../../../../core/services/remote/error_handler/api_exception.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  @override
  Future<Either<Failure, UserEntity>> register(RegisterParams params) async {
    try {
      final UserEntity user = await authRemoteDataSource.register(params);
      return Right(user);
    } on ApiException catch (exception) {
      return Left(_mapExceptionToFailure(exception));
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'An unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> login(LoginParams params) async {
    try {
      final AuthSessionEntity session = await authRemoteDataSource.login(
        params,
      );

      await authLocalDataSource.saveToken(session.accessToken);
      await authLocalDataSource.saveUserEmail(session.user.email);
      await authLocalDataSource.saveUserName(session.user.username ?? '');

      return Right(session);
    } on ApiException catch (exception) {
      return Left(_mapExceptionToFailure(exception));
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'An unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordVerificationEntity>> forgotPassword(
    ForgotPasswordParams params,
  ) async {
    try {
      final ForgotPasswordVerificationEntity result = await authRemoteDataSource
          .forgotPassword(params);

      return Right(result);
    } on ApiException catch (exception) {
      return Left(_mapExceptionToFailure(exception));
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'An unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<Failure, CodeVerificationEntity>> checkResetCode(
    CheckResetCodeParams params,
  ) async {
    try {
      final CodeVerificationEntity result = await authRemoteDataSource
          .checkResetCode(params);

      return Right(result);
    } on ApiException catch (exception) {
      return Left(_mapExceptionToFailure(exception));
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'An unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
    ResetPasswordParams params,
  ) async {
    try {
      await authRemoteDataSource.resetPassword(params);
      return const Right(unit);
    } on ApiException catch (exception) {
      return Left(_mapExceptionToFailure(exception));
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'An unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserFullDataEntity>> getCurrentUser() async {
    try {
      final UserFullDataEntity user = await authRemoteDataSource
          .getCurrentUser();

      return Right(user);
    } on ApiException catch (exception) {
      return Left(_mapExceptionToFailure(exception));
    } catch (_) {
      return const Left(
        UnknownFailure(message: 'An unexpected error occurred.'),
      );
    }
  }

  Failure _mapExceptionToFailure(ApiException exception) {
    if (exception is ValidationException) {
      return ValidationFailure(
        message: exception.message,
        errors: exception.errors,
      );
    }

    if (exception is UnauthorizedException) {
      return UnauthorizedFailure(message: exception.message);
    }

    if (exception is ForbiddenException) {
      return ForbiddenFailure(message: exception.message);
    }

    if (exception is NotFoundException) {
      return NotFoundFailure(message: exception.message);
    }

    if (exception is ConflictException) {
      return ConflictFailure(message: exception.message);
    }

    if (exception is NetworkException) {
      return NetworkFailure(message: exception.message);
    }

    if (exception is ServerException) {
      return ServerFailure(message: exception.message);
    }

    return UnknownFailure(message: exception.message);
  }
}
