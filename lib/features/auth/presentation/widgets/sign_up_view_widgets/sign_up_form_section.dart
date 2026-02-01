import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskora/core/config/constants/icon_path.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/validators/vlaidate_fun.dart';
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
          fieldType: FieldType.name,
          text: AppStrings.formName,
          hintText: AppStrings.formHintName,
          textEditingController: controllerName,
        ),
        context.sizedBoxHeight_10,
        //----- Email -----
        CustomInputFiled(
          fieldType: FieldType.email,
          text: AppStrings.formEmail,
          hintText: AppStrings.formHintEmail,
          textEditingController: controllerEmail,
          prefixIcon: IconPath.email,
        ),
        context.sizedBoxHeight_10,
        //----- Password -----
        CustomInputFiled(
          fieldType: FieldType.password,
          text: AppStrings.formPassword,
          hintText: AppStrings.formHintPassword,
          textEditingController: controllerPassword,
          prefixIcon: IconPath.passwordLock,
          suffixIcon: IconPath.hide,
          suffixIconOff: IconPath.unHide,
          isPassword: true,
        ),
        context.sizedBoxHeight_10,
        //----- Hourly rate  -----
        CustomInputFiled(
          fieldType: FieldType.hourly,
          text: AppStrings.formHourlyRate,
          hintText: AppStrings.formHintHourlyRate,
          textEditingController: controllerHourlyRate,
          suffixIcon: IconPath.dolllarEmoji,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([.,]\d*)?$')),
          ],
        ),
      ],
    );
  }
}
