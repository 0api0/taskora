import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/splash_onboarding/presentation/bloc/splash_onboarding_bloc.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/onboarding_widgets/onboarding_view_bloc.dart';

import '../../../../core/di/service_locator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SplashOnboardingBloc>(),
        child: const OnboardingViewBloc(),
      ),
    );
  }
}
