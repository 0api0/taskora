import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/splash_onboarding/presentation/views/splash_view.dart';

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
    GoRoute(path: '/dvf', builder: (context, state) => const HomeTest()),
  ],
  errorBuilder: (context, state) => const ErrorViewTest(),
);
