import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../widgets/sign_up_view_widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: true,
          body: SignUpViewBody(),
        ),
      ),
    );
  }
}
