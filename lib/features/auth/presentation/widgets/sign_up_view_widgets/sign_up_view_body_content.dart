import 'package:flutter/material.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_footer_section.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_form_section.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_header_section.dart';

import '../../../../../core/extensions/sizes_extension.dart';

class SignUpViewBodyContent extends StatelessWidget {
  const SignUpViewBodyContent({
    super.key,
    required this.formKey,
    required this.controllerName,
    required this.controllerUserName,
    required this.controllerEmail,
    required this.controllerPassword,
    required this.controllerHourlyRate,
    this.onCreateAccountPressed,
    required this.onLoginTap,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerName;
  final TextEditingController controllerUserName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerHourlyRate;
  final VoidCallback? onCreateAccountPressed;
  final VoidCallback onLoginTap;
  final bool isLoading;

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
                const SignUpHeaderSection(),
                SignUpFormSection(
                  controllerName: controllerName,
                  controllerEmail: controllerEmail,
                  controllerPassword: controllerPassword,
                  controllerHourlyRate: controllerHourlyRate,
                  controllerUserName: controllerUserName,
                ),
                SignUpFooterSection(
                  onCreateAccountPressed: onCreateAccountPressed,
                  onLoginTap: onLoginTap,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
