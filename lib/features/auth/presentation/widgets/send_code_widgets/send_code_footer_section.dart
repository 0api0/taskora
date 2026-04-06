import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_rich_text.dart';

class SendCodeFooterSection extends StatelessWidget {
  const SendCodeFooterSection({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.sizedBoxHeight_60,
        CustomButton(
          text: AppStrings.buttonVerifyEmail,
          onPressed: onPressed,
          isLoading: isLoading,
        ),
        context.sizedBoxHeight_10,
        CustomRichTextRow(
          text: AppStrings.formReCode,
          actionText: AppStrings.formReCodeButton,
          onTap: () {
            //TODO : RESEND CODE
          },
        ),
      ],
    );
  }
}
