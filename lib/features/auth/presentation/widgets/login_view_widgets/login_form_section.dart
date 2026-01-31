import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_input_field/custom_input_field.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
    required this.controllerEmail,
    required this.controllerPassword,
  });

  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------- Input Field ----------------
        context.sizedBoxHeight_14,
        CustomInputFiled(
          text: AppStrings.formEmail,
          hintText: AppStrings.formHintEmail,
          textEditingController: controllerEmail,
        ),
        context.sizedBoxHeight_10,
        CustomInputFiled(
          text: AppStrings.formPassword,
          hintText: AppStrings.formHintPassword,
          textEditingController: controllerPassword,
        ),
        context.sizedBoxHeight_10,
      ],
    );
  }
}
