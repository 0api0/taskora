import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/auth/params/check_reset_code_params.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_event.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_view_body_content.dart';

class SendCodeViewBody extends StatefulWidget {
  const SendCodeViewBody({super.key});

  @override
  State<SendCodeViewBody> createState() => _SendCodeViewBodyState();
}

class _SendCodeViewBodyState extends State<SendCodeViewBody> {
  late final TextEditingController _controllerPinCode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllerPinCode = TextEditingController();
  }

  @override
  void dispose() {
    _controllerPinCode.dispose();
    super.dispose();
  }

  void _onVerifyCodePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final pinCode = _controllerPinCode.text.trim();
    final pinCodeInt = int.tryParse(pinCode) ?? 0;
    context.read<PasswordRecoveryBloc>().add(
      CheckResetCodeRequested(CheckResetCodeParams(code: pinCodeInt)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordRecoveryBloc, PasswordRecoveryState>(
      listener: (context, state) {
        debugPrint('status: ${state.status}');
        debugPrint(
          'codeVerificationEntity: ${state.forgotPasswordVerification}',
        );
        debugPrint('message: ${state.message}');
        if ((state.status == PasswordRecoveryStatus.failure ||
                state.status == PasswordRecoveryStatus.networkFailure) &&
            state.message != null &&
            state.message!.isNotEmpty) {
          context.push(
            RoutersName.authRoute.bodyError,
            extra: {
              'message': state.message,
              'passwordRecoveryStatus': state.status,
            },
          );
        }

        if (state.status == PasswordRecoveryStatus.success &&
            state.codeVerification != null) {
          context.push(
            RoutersName.authRoute.newPassword,
            extra: context.read<PasswordRecoveryBloc>(),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.status == PasswordRecoveryStatus.loading;
        return SendCodeViewBodyContent(
          isLoading: isLoading,
          controllerPinCode: _controllerPinCode,
          formKey: _formKey,
          onVerifyCodePressed: isLoading ? null : _onVerifyCodePressed,
        );
      },
    );
  }
}
