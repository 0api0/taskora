import 'package:go_router/go_router.dart';

import '../../../../core/router/routers_name.dart';
import '../../../features/auth/presentation/views/forgot_password_view.dart';
import '../../../features/auth/presentation/views/login_view.dart';
import '../../../features/auth/presentation/views/new_password_view.dart';
import '../../../features/auth/presentation/views/reset_password_view.dart';
import '../../../features/auth/presentation/views/send_code_view.dart';
import '../../../features/auth/presentation/views/sign_up_view.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    path: RoutersName.login,
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: RoutersName.signUp,
    builder: (context, state) => const SignUpView(),
  ),
  GoRoute(
    path: RoutersName.forgotPassword,
    builder: (context, state) => const ForgotPasswordView(),
  ),
  GoRoute(
    path: RoutersName.resetPassword,
    builder: (context, state) => const ResetPasswordView(),
  ),
  GoRoute(
    path: RoutersName.sendCode,
    builder: (context, state) => const SendCodeView(),
  ),
  GoRoute(
    path: RoutersName.newPassword,
    builder: (context, state) => const NewPasswordView(),
  ),
];
