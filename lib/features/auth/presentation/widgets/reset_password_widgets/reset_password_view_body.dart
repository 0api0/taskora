import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/features/auth/params/forgot_password_params.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_event.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';
import 'package:taskora/features/auth/presentation/widgets/reset_password_widgets/reset_password_view_body_content.dart';

import '../../../../../core/router/routers_name.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  late final TextEditingController _controllerEmail;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final email = _controllerEmail.text.trim();
    context.read<PasswordRecoveryBloc>().add(
      ForgotPasswordRequested(ForgotPasswordParams(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordRecoveryBloc, PasswordRecoveryState>(
      listenWhen: (previous, current) =>
          previous.status != current.status || previous.step != current.step,
      listener: (context, state) {
        if ((state.status == PasswordRecoveryStatus.failure ||
                state.status == PasswordRecoveryStatus.networkFailure) &&
            state.step == PasswordRecoveryStep.enterEmail &&
            state.message != null &&
            state.message!.isNotEmpty) {
          context.push(
            RoutersName.authRoute.bodyError,
            extra: {
              'message': state.message,
              'passwordRecoveryStatus': state.status,
            },
          );
          if (!context.mounted) {
            return;
          }

          context.read<PasswordRecoveryBloc>().add(
            const ClearPasswordRecoveryStatusRequested(),
          );

          return;
        }

        if (state.status == PasswordRecoveryStatus.success &&
            state.step == PasswordRecoveryStep.enterCode &&
            state.forgotPasswordVerification != null) {
          context.push(
            RoutersName.authRoute.sendCode,
            extra: context.read<PasswordRecoveryBloc>(),
          );
        }
      },
      builder: (context, state) {
        final bool isLoading = state.status == PasswordRecoveryStatus.loading;
        return ResetPasswordViewBodyContent(
          formKey: _formKey,
          controllerEmail: _controllerEmail,
          isLoading: isLoading,
          onContinuePressed: isLoading ? null : _onContinuePressed,
        );
      },
    );
  }
}
