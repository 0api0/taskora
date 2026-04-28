import '../../../params/check_reset_code_params.dart';
import '../../../params/forgot_password_params.dart';
import '../../../params/login_params.dart';
import '../../../params/register_params.dart';
import '../../../params/reset_password_params.dart';
import '../../models/auth_session_model.dart';
import '../../models/code_verification_model.dart';
import '../../models/forgot_password_verification_model.dart';
import '../../models/user_full_data_model.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(RegisterParams params);

  Future<AuthSessionModel> login(LoginParams params);

  Future<ForgotPasswordVerificationModel> forgotPassword(
    ForgotPasswordParams params,
  );

  Future<CodeVerificationModel> checkResetCode(CheckResetCodeParams params);

  Future<void> resetPassword(ResetPasswordParams params);

  Future<UserFullDataModel> getCurrentUser();
}
