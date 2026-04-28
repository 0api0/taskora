import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/icon_path.dart';
import '../../../../../core/config/validators/app_validators.dart';
import '../../../../../core/config/validators/vlaidate_fun.dart';
import '../../../../../core/config/widgets/custom_input_field/custom_input_field.dart';

class NewPasswordFormSection extends StatelessWidget {
  const NewPasswordFormSection({
    super.key,
    required this.controllerPassword,
    required this.controllerConfirmPassword,
  });

  final TextEditingController controllerPassword;
  final TextEditingController controllerConfirmPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.sizedBoxHeight_22,
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
        context.sizedBoxHeight_16,
        CustomInputFiled(
          validator: (value) {
            return AppValidators.confirmPassword(
              value,
              originalPassword: controllerPassword.text,
            );
          },
          fieldType: FieldType.password,
          text: AppStrings.formConfirmPassword,
          hintText: AppStrings.formHintPassword,
          textEditingController: controllerConfirmPassword,
          suffixIcon: IconPath.hide,
          suffixIconOff: IconPath.unHide,
          prefixIcon: IconPath.passwordLock,
          isPassword: true,
        ),
        context.sizedBoxHeight_60,
      ],
    );
  }
}
