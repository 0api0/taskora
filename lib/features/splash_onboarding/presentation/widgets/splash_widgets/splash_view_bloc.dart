import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/splash_widgets/splash_view_body.dart';

import '../../../../auth/presentation/views/login_view.dart';
import '../../bloc/splash_onboarding_bloc.dart';
import '../../bloc/splash_onboarding_state.dart';

class SplashViewBloc extends StatelessWidget {
  const SplashViewBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashOnboardingBloc, SplashOnboardingState>(
      listener: (context, state) async {
        await Future.delayed(const Duration(milliseconds: 2000));
        switch (state) {
          case ShowOnboarding _:
            context.go(RoutersName.splashOnboardingRoute.onboarding);
            return;
          case NavigateToLogin _:
            context.go(RoutersName.authRoute.login);
            return;
          case NavigateToHome _:
            context.go(RoutersName.splashOnboardingRoute.home);
            return;
        }
      },
      child: const SplashViewBody(),
    );
  }
}
