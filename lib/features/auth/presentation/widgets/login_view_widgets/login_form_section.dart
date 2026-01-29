import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_input_field/custom_input_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------- Input Field ----------------
        context.sizedBoxHeight_14,
        CustomInputFiled(
          text: AppStrings.formEmail,
          hintText: AppStrings.formHintEmail,
          textEditingController: _controllerEmail,
        ),
        context.sizedBoxHeight_10,
        CustomInputFiled(
          text: AppStrings.formPassword,
          hintText: AppStrings.formHintPassword,
          textEditingController: _controllerPassword,
        ),
        context.sizedBoxHeight_10,
      ],
    );
  }
}
