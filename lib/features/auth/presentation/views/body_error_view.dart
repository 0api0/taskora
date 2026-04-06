import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/config/widgets/custom_body_error.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';

import '../core/map/error_view_data_mapper.dart';

class BodyErrorView extends StatelessWidget {
  const BodyErrorView({
    super.key,
    this.message,
    this.authStatus,
    this.errors,
    this.passwordRecoveryStatus,
  });

  final String? message;
  final List<String>? errors;
  final AuthStatus? authStatus;
  final PasswordRecoveryStatus? passwordRecoveryStatus;

  @override
  Widget build(BuildContext context) {
    final ErrorViewType type =
        (authStatus == AuthStatus.networkFailure ||
            passwordRecoveryStatus == PasswordRecoveryStatus.networkFailure)
        ? ErrorViewType.network
        : ErrorViewType.general;
    final errorData = ErrorViewDataMapper.map(errorViewType: type);

    return Scaffold(
      body: CustomBodyError(
        image: errorData.imagePath,
        title: errorData.title,
        subTitle: message!,
        errorData: errors?.first,
        textButton: errorData.primaryButtonText,
        textButtonOutline: errorData.secondaryButtonText,
        onPressed: context.pop,
        onPressedOutline: () {},
      ),
    );
  }
}
