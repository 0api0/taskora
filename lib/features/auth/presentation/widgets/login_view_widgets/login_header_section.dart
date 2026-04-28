import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/color_manager.dart';
import '../../../../../core/config/widgets/custom_app_bar.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -------------- AppBar ----------------
        const CustomAppBar(title: AppStrings.buttonLoginIn, showIcon: false),
        // -------------- Title & subTitle text ----------------
        Text(
          AppStrings.messgaesWelcomeBack,
          style: context.bold.copyWith(color: ColorManager.primaryColorApp),
        ),
        Text(
          AppStrings.messgaesSubWelcomeBack,
          style: context.regular.copyWith(color: ColorManager.textHintColor),
        ),
      ],
    );
  }
}
