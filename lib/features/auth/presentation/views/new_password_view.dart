import 'package:flutter/material.dart';

import '../widgets/new_password_widgets/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: NewPasswordViewBody(),
      ),
    );
  }
}
