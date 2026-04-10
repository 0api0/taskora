import 'package:flutter/material.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/color_manager.dart';
import '../../../../../core/config/widgets/custom_app_bar.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/extensions/sizes_extension.dart';
import '../../../../../core/extensions/text_style_extension.dart';
import 'new_password_form_section.dart';

class NewPasswordViewBodyContent extends StatelessWidget {
  const NewPasswordViewBodyContent({
    super.key,
    required this.formKey,
    required this.controllerPassword,
    required this.controllerConfirmPassword,
    this.onChangePasswordPressed,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerPassword;
  final TextEditingController controllerConfirmPassword;
  final VoidCallback? onChangePasswordPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingScaffold,
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // ------------- Header -----------
                const CustomAppBar(title: AppStrings.titleCreateNewPassword),
                Text(
                  AppStrings.messgaesSubGreatPassword,
                  style: context.regular.copyWith(
                    color: ColorManager.textHintColor,
                  ),
                ),

                // ------------ form -----------
                NewPasswordFormSection(
                  controllerPassword: controllerPassword,
                  controllerConfirmPassword: controllerConfirmPassword,
                ),

                // ------------ footer --------------
                CustomButton(
                  text: AppStrings.buttonChangePassword,
                  onPressed: onChangePasswordPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
