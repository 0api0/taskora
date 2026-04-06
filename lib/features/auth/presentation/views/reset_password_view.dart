import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../widgets/reset_password_widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PasswordRecoveryBloc>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: true,
          body: ResetPasswordViewBody(),
        ),
      ),
    );
  }
}
