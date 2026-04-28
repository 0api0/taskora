import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';
import 'package:taskora/features/auth/presentation/views/body_error_view.dart';

import '../../../../core/router/routers_name.dart';
import '../../../features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
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
    builder: (context, state) {
      final PasswordRecoveryBloc bloc = state.extra as PasswordRecoveryBloc;
      return BlocProvider.value(value: bloc, child: const SendCodeView());
    },
  ),
  GoRoute(
    path: RoutersName.authRoute.newPassword,
    builder: (context, state) {
      final PasswordRecoveryBloc bloc = state.extra as PasswordRecoveryBloc;

      return BlocProvider.value(value: bloc, child: const NewPasswordView());
    },
  ),
  GoRoute(
    path: RoutersName.authRoute.bodyError,
    builder: (context, state) {
      final data = state.extra as Map<String, dynamic>?;
      return BodyErrorView(
        message: data?['message'] ?? 'Something errors',
        authStatus: data?['authStatus'] ?? AuthStatus.failure,
        passwordRecoveryStatus:
            data?['passwordRecoveryStatus'] ?? PasswordRecoveryStatus.failure,
        errors: data?['errors'],
      );
    },
  ),
];
