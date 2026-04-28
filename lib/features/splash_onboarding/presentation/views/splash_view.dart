import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/splash_onboarding/presentation/bloc/splash_onboarding_event.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/splash_onboarding_bloc.dart';
import '../widgets/splash_widgets/splash_view_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SplashOnboardingBloc>()..add(AppStartedEvent()),
        child: const SplashViewBloc(),
      ),
    );
  }
}
