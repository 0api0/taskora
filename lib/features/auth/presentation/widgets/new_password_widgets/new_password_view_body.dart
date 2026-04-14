import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/features/auth/params/reset_password_params.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';
import 'package:taskora/features/auth/presentation/widgets/new_password_widgets/new_password_view_body_content.dart';
import '../../../../../core/router/routers_name.dart';
import '../../bloc/password_recovery/password_recovery_event.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  late final TextEditingController _controllerPassword;
  late final TextEditingController _controllerConfirmPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllerPassword = TextEditingController();
    _controllerConfirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerPassword.dispose();
    _controllerConfirmPassword.dispose();
    super.dispose();
  }

  void _onChangePasswordPressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final confirmPassword = _controllerConfirmPassword.text;
    final String email =
        context
            .read<PasswordRecoveryBloc>()
            .state
            .forgotPasswordVerification
            ?.email ??
        '';
    context.read<PasswordRecoveryBloc>().add(
      ResetPasswordRequested(
        ResetPasswordParams(newPassword: confirmPassword, email: email),
      ),
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
            state.step == PasswordRecoveryStep.enterNewPassword &&
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
            state.codeVerification == null &&
            state.forgotPasswordVerification == null &&
            state.step == PasswordRecoveryStep.completed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password changed successfully')),
          );

          context.go(RoutersName.authRoute.login);
        }
      },
      builder: (context, state) {
        final bool isLoading = state.status == PasswordRecoveryStatus.loading;
        return NewPasswordViewBodyContent(
          formKey: _formKey,
          controllerPassword: _controllerPassword,
          controllerConfirmPassword: _controllerConfirmPassword,
          onChangePasswordPressed: isLoading ? null : _onChangePasswordPressed,
          isLoading: isLoading,
        );
      },
    );
  }
}
