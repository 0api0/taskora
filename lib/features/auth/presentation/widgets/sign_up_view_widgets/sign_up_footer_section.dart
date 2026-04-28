import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_rich_text.dart';

class SignUpFooterSection extends StatelessWidget {
  const SignUpFooterSection({
    super.key,
    required this.onCreateAccountPressed,
    required this.onLoginTap,
  });

  final VoidCallback? onCreateAccountPressed;
  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------- Log in button ----------------
        context.sizedBoxHeight_36,
        BlocSelector<AuthBloc, AuthState, bool>(
          selector: (state) => state.status == AuthStatus.loading,
          builder: (context, isLoading) {
            return CustomButton(
              text: AppStrings.formCreateAccountButton,
              onPressed: isLoading ? null : onCreateAccountPressed,
              isLoading: isLoading,
            );
          },
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
