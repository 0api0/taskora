import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/splash_onboarding/presentation/views/splash_view.dart';

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
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text(state.error.toString()))),
);
