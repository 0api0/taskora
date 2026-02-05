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
    path: RoutersName.authRoute.login,
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: RoutersName.authRoute.signUp,
    builder: (context, state) => const SignUpView(),
  ),
  GoRoute(
    path: RoutersName.authRoute.forgotPassword,
    builder: (context, state) => const ForgotPasswordView(),
  ),
  GoRoute(
    path: RoutersName.authRoute.resetPassword,
    builder: (context, state) => const ResetPasswordView(),
  ),
  GoRoute(
    path: RoutersName.authRoute.sendCode,
    builder: (context, state) => const SendCodeView(),
  ),
  GoRoute(
    path: RoutersName.authRoute.newPassword,
    builder: (context, state) => const NewPasswordView(),
  ),
];
