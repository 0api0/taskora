import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/feature_router/splash_onboardig.dart';
import 'package:taskora/core/router/routers_name.dart';

import '../../features/splash_onboarding/presentation/views/error_view_test.dart';
import 'feature_router/auth_routes.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutersName.splash,
  routes: [
    //----------------- Feature Splash onboarding routers -----------------
    ...splashOnboarding,
    //----------------- Feature Auth routers  -----------------
    ...authRoutes,
  ],
  errorBuilder: (context, state) => const ErrorViewTest(),
);
