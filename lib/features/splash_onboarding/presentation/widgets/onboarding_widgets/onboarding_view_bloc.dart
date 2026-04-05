import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/routers_name.dart';
import '../../bloc/splash_onboarding_bloc.dart';
import '../../bloc/splash_onboarding_state.dart';
import 'onboarding_view_body.dart';

class OnboardingViewBloc extends StatelessWidget {
  const OnboardingViewBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashOnboardingBloc, SplashOnboardingState>(
      listener: (context, state) {
        if (state is NavigateToLogin) {
          context.go(RoutersName.authRoute.login);
        }
      },
      child: const OnboardingViewBody(),
    );
  }
}
