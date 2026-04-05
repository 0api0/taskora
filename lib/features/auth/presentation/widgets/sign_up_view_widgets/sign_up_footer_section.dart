import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_rich_text.dart';

class SignUpFooterSection extends StatelessWidget {
  const SignUpFooterSection({
    super.key,
    required this.onCreateAccountPressed,
    required this.onLoginTap,
    required this.isLoading,
  });

  final VoidCallback? onCreateAccountPressed;
  final VoidCallback onLoginTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------- Log in button ----------------
        context.sizedBoxHeight_36,
        CustomButton(
          text: AppStrings.formCreateAccountButton,
          onPressed: onCreateAccountPressed,
          isLoading: isLoading,
        ),
        context.sizedBoxHeight_10,
        // -------------- rich text row ----------------
        Center(
          child: CustomRichTextRow(
            text: AppStrings.formLogIn,
            actionText: AppStrings.formLogInButton,
            onTap: onLoginTap,
          ),
        ),
      ],
    );
  }
}
