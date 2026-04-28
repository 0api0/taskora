import 'package:flutter/material.dart';
import 'package:taskora/features/auth/presentation/widgets/reset_password_widgets/reset_password_footer_section.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/color_manager.dart';
import '../../../../../core/config/widgets/custom_app_bar.dart';
import '../../../../../core/extensions/sizes_extension.dart';
import '../../../../../core/extensions/text_style_extension.dart';

class ResetPasswordViewBodyContent extends StatelessWidget {
  const ResetPasswordViewBodyContent({
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
    return Padding(
      padding: context.paddingScaffold,
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------- Header ----------------
              const CustomAppBar(title: AppStrings.titleEnterYourEmailAddress),
              Text(
                AppStrings.messgaesSubReceiveCode,
                style: context.regular.copyWith(
                  color: ColorManager.textHintColor,
                ),
              ),
              // -------------- Footer ----------------
              ResetPasswordFooterSection(
                formKey: formKey,
                controllerEmail: controllerEmail,
                onContinuePressed: onContinuePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
