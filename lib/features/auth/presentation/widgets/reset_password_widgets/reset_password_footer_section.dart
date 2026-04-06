import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/router/routers_name.dart';

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
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerEmail;
  final VoidCallback? onContinuePressed;
  final bool isLoading;

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
          CustomButton(
            text: AppStrings.buttonContinue,
            onPressed: onContinuePressed,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
