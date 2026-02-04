import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_footer_section.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_form_section.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_header.dart';

class SendCodeViewBody extends StatefulWidget {
  const SendCodeViewBody({super.key});

  @override
  State<SendCodeViewBody> createState() => _SendCodeViewBodyState();
}

class _SendCodeViewBodyState extends State<SendCodeViewBody> {
  late final TextEditingController _controllerPinCode;

  @override
  void initState() {
    super.initState();
    _controllerPinCode = TextEditingController();
  }

  @override
  void dispose() {
    _controllerPinCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingScaffold,
      child: SafeArea(
        child: Column(
          children: [
            // -------------- Header ----------------
            const SendCodeHeader(),
            // -------------- body ----------------
            SendCodeFormSection(controllerPinCode: _controllerPinCode),
            // -------------- Footer ----------------
            SendCodeFooterSection(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
