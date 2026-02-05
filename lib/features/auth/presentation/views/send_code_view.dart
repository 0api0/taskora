import 'package:flutter/material.dart';

import '../widgets/send_code_widgets/send_code_view_body.dart';

class SendCodeView extends StatelessWidget {
  const SendCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SendCodeViewBody(),
      ),
    );
  }
}
