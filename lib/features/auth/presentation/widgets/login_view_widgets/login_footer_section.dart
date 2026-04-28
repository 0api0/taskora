import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:taskora/features/auth/presentation/widgets/login_view_widgets/remember_me_row/remember_me_row.dart';

import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/widgets/custom_button/custom_button.dart';
import '../../../../../core/config/widgets/custom_rich_text.dart';
import '../../bloc/auth/auth_state.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({
    super.key,
    required this.onLoginPressed,
    required this.onCreateAccountTap,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  final VoidCallback? onLoginPressed;
  final VoidCallback onCreateAccountTap;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -------------- Remember me ----------------
        RememberMeRow(value: rememberMe, onChanged: onRememberMeChanged),
        context.sizedBoxHeight_36,
        // -------------- Log in button ----------------
        BlocSelector<AuthBloc, AuthState, bool>(
          selector: (state) => state.status == AuthStatus.loading,
          builder: (context, isLoading) {
            return CustomButton(
              text: AppStrings.buttonLoginIn,
              onPressed: isLoading ? null : onLoginPressed,
              isLoading: isLoading,
            );
          },
        ),
        context.sizedBoxHeight_10,
        // -------------- rich text row ----------------
        Center(
          child: CustomRichTextRow(
            text: AppStrings.formCreateAccount,
            actionText: AppStrings.formCreateAccountButton,
            onTap: onCreateAccountTap,
          ),
        ),
      ],
    );
  }
}
