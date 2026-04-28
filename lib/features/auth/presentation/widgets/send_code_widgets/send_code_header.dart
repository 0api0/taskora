import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/color_manager.dart';
import '../../../../../core/config/widgets/custom_app_bar.dart';

class SendCodeHeader extends StatelessWidget {
  const SendCodeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(title: AppStrings.titleEnterCode),
        Text(
          AppStrings.messgaesSubCheckCode,
          style: context.regular.copyWith(color: ColorManager.textHintColor),
        ),
        context.sizedBoxHeight_60,
      ],
    );
  }
}
