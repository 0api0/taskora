import 'package:go_router/go_router.dart';

import '../../../features/splash_onboarding/presentation/views/home_test.dart';
import '../../../features/splash_onboarding/presentation/views/onboarding_view.dart';
import '../../../features/splash_onboarding/presentation/views/splash_view.dart';
import '../routers_name.dart';

final List<GoRoute> splashOnboarding = [
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
];
