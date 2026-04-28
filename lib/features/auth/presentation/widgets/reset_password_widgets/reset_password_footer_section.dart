import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/icon_path.dart';
import '../../../../../core/config/validators/vlaidate_fun.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_input_field/custom_input_field.dart';

class ResetPasswordFooterSection extends StatelessWidget {
  const ResetPasswordFooterSection({
    super.key,
    required this.formKey,
    required this.controllerEmail,
    this.onContinuePressed,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerEmail;
  final VoidCallback? onContinuePressed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // -------------- Field email  ----------------
          context.sizedBoxHeight_22,
          CustomInputFiled(
            fieldType: FieldType.email,
            text: AppStrings.formEmail,
            hintText: AppStrings.formHintEmail,
            textEditingController: controllerEmail,
            prefixIcon: IconPath.email,
            keyboardType: TextInputType.emailAddress,
          ),
          context.sizedBoxHeight_60,

          // -------------- Log in button ----------------
          BlocSelector<PasswordRecoveryBloc, PasswordRecoveryState, bool>(
            selector: (state) => state.status == PasswordRecoveryStatus.loading,
            builder: (context, isLoading) {
              return CustomButton(
                text: AppStrings.buttonContinue,
                onPressed: isLoading ? null : onContinuePressed,
                isLoading: isLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
