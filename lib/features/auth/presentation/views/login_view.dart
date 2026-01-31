import 'package:flutter/material.dart';

import '../widgets/login_view_widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: LoginViewBody(),
      ),
    );
  }
}
