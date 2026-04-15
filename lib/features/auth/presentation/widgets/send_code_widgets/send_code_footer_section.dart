import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/password_recovery/password_recovery_state.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_rich_text.dart';

class SendCodeFooterSection extends StatelessWidget {
  const SendCodeFooterSection({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.sizedBoxHeight_60,
        BlocSelector<PasswordRecoveryBloc, PasswordRecoveryState, bool>(
          selector: (state) => state.status == PasswordRecoveryStatus.loading,
          builder: (context, isLoading) {
            return CustomButton(
              text: AppStrings.buttonVerifyEmail,
              onPressed: isLoading ? null : onPressed,
              isLoading: isLoading,
            );
          },
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
