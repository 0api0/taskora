import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import 'login_footer_section.dart';
import 'login_form_section.dart';
import 'login_header_section.dart';

class LoginViewBodyContent extends StatelessWidget {
  const LoginViewBodyContent({
    super.key,
    required this.formKey,
    required this.controllerEmail,
    required this.controllerPassword,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onLoginPressed,
    required this.onCreateAccountTap,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;
  final VoidCallback? onLoginPressed;
  final VoidCallback onCreateAccountTap;
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
                const LoginHeaderSection(),
                LoginFormSection(
                  controllerEmail: controllerEmail,
                  controllerPassword: controllerPassword,
                ),
                LoginFooterSection(
                  onLoginPressed: onLoginPressed,
                  onCreateAccountTap: onCreateAccountTap,
                  rememberMe: rememberMe,
                  onRememberMeChanged: onRememberMeChanged,
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
