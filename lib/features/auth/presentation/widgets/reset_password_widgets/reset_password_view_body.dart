import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/config/widgets/custom_app_bar.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import 'package:taskora/features/auth/presentation/widgets/reset_password_widgets/reset_password_footer_section.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

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
              const ResetPasswordFooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
