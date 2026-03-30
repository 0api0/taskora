import 'package:dio/dio.dart';
import 'package:taskora/core/services/remote/api_constants.dart';
import 'package:taskora/core/services/remote/remote_service.dart';
import 'package:taskora/features/auth/data/core/endpoints/auth_endpoints.dart';
import 'package:taskora/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:taskora/features/auth/data/models/auth_session_model.dart';
import 'package:taskora/features/auth/data/models/code_verification_model.dart';
import 'package:taskora/features/auth/data/models/forgot_password_verification_model.dart';
import 'package:taskora/features/auth/data/models/user_full_data_model.dart';
import 'package:taskora/features/auth/data/models/user_model.dart';
import 'package:taskora/features/auth/params/check_reset_code_params.dart';
import 'package:taskora/features/auth/params/forgot_password_params.dart';
import 'package:taskora/features/auth/params/login_params.dart';
import 'package:taskora/features/auth/params/register_params.dart';
import 'package:taskora/features/auth/params/reset_password_params.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._remoteService);

  final RemoteService _remoteService;

  @override
  Future<AuthSessionModel> login(LoginParams params) async {
    final responseLogin = await _remoteService.request(
      method: HttpMethod.post,
      path: AuthEndpoints.login,
      data: {"email": params.email, "password": params.password},
    );
    return AuthSessionModel.fromLoginResponse(responseLogin);
  }

  @override
  Future<UserModel> register(RegisterParams params) async {
    final responseSignUp = await _remoteService.request(
      method: HttpMethod.post,
      path: AuthEndpoints.signUp,
      data: {
        'name': params.name,
        'email': params.email,
        'username': params.username,
        'password': params.password,
      },
    );
    return UserModel.fromSignupResponse(responseSignUp);
  }

  @override
  Future<ForgotPasswordVerificationModel> forgotPassword(
    ForgotPasswordParams params,
  ) async {
    final response = await _remoteService.request(
      method: HttpMethod.post,
      path: AuthEndpoints.forgotPassword,
      data: {'email': params.email},
    );

    return ForgotPasswordVerificationModel.fromResponse(response);
  }

  @override
  Future<CodeVerificationModel> checkResetCode(
    CheckResetCodeParams params,
  ) async {
    final Map<String, dynamic> response = await _remoteService.request(
      method: HttpMethod.post,
      path: AuthEndpoints.checkCode,
      data: {'code': params.code},
    );

    return CodeVerificationModel.fromResponse(response);
  }

  @override
  Future<void> resetPassword(ResetPasswordParams params) async {
    await _remoteService.request(
      method: HttpMethod.post,
      path: AuthEndpoints.resetPassword,
      data: {'email': params.email, 'newPassword': params.newPassword},
    );
  }

  @override
  Future<UserFullDataModel> getCurrentUser() async {
    final Map<String, dynamic> response = await _remoteService.request(
      method: HttpMethod.get,
      path: AuthEndpoints.getUserFullData,
      options: Options(extra: {ApiConstants.requiresAuth: true}),
    );

    return UserFullDataModel.fromResponse(response);
  }
}
