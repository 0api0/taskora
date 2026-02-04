import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/auth/presentation/views/forgot_password_view.dart';
import 'package:taskora/features/auth/presentation/views/login_view.dart';
import 'package:taskora/features/auth/presentation/views/reset_password_view.dart';
import 'package:taskora/features/auth/presentation/views/sign_up_view.dart';
import 'package:taskora/features/splash_onboarding/presentation/views/splash_view.dart';

import '../../features/auth/presentation/views/send_code_view.dart';
import '../../features/splash_onboarding/presentation/views/error_view_test.dart';
import '../../features/splash_onboarding/presentation/views/home_test.dart';
import '../../features/splash_onboarding/presentation/views/onboarding_view.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutersName.splash,
  routes: [
    GoRoute(
      path: RoutersName.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutersName.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: RoutersName.home,
      builder: (context, state) => const HomeTest(),
    ),
    //----------------- Auth -----------------
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
  ],
  errorBuilder: (context, state) => const ErrorViewTest(),
);
