import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/router/routers_name.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/icon_path.dart';
import '../../../../../core/config/validators/vlaidate_fun.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_input_field/custom_input_field.dart';

class ResetPasswordFooterSection extends StatefulWidget {
  const ResetPasswordFooterSection({super.key});

  @override
  State<ResetPasswordFooterSection> createState() =>
      _ResetPasswordFooterSectionState();
}

class _ResetPasswordFooterSectionState
    extends State<ResetPasswordFooterSection> {
  late final TextEditingController _controllerEmail;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final email = _controllerEmail.text.trim();
    context.push(RoutersName.authRoute.sendCode);
    // TODO: Bloc
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // -------------- Field email  ----------------
          context.sizedBoxHeight_22,
          CustomInputFiled(
            fieldType: FieldType.email,
            text: AppStrings.formEmail,
            hintText: AppStrings.formHintEmail,
            textEditingController: _controllerEmail,
            prefixIcon: IconPath.email,
            keyboardType: TextInputType.emailAddress,
          ),
          context.sizedBoxHeight_60,

          // -------------- Log in button ----------------
          CustomButton(
            text: AppStrings.buttonContinue,
            onPressed: _onContinuePressed,
          ),
        ],
      ),
    );
  }
}
