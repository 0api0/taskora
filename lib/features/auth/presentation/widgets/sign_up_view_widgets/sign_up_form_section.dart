import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_input_field/custom_input_field.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
    required this.controllerName,
    required this.controllerEmail,
    required this.controllerPassword,
    required this.controllerHourlyRate,
  });

  final TextEditingController controllerName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerHourlyRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------- Input Field ----------------
        context.sizedBoxHeight_14,
        //----- Name -----
        CustomInputFiled(
          text: AppStrings.formName,
          hintText: AppStrings.formHintName,
          textEditingController: controllerEmail,
        ),
        context.sizedBoxHeight_10,
        //----- Email -----
        CustomInputFiled(
          text: AppStrings.formEmail,
          hintText: AppStrings.formHintEmail,
          textEditingController: controllerEmail,
        ),
        context.sizedBoxHeight_10,
        //----- Password -----
        CustomInputFiled(
          text: AppStrings.formPassword,
          hintText: AppStrings.formHintPassword,
          textEditingController: controllerEmail,
        ),
        context.sizedBoxHeight_10,
        //----- Hourly rate  -----
        CustomInputFiled(
          text: AppStrings.formHourlyRate,
          hintText: AppStrings.formHintHourlyRate,
          textEditingController: controllerEmail,
        ),
      ],
    );
  }
}
