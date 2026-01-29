import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'login_footer_section.dart';
import 'login_form_section.dart';
import 'login_header_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingScaffold,
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginHeaderSection(),
                LoginFormSection(),
                LoginFooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
