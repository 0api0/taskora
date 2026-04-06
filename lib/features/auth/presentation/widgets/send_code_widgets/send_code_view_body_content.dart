import 'package:flutter/material.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_footer_section.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_form_section.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_header.dart';

import '../../../../../core/extensions/sizes_extension.dart';

class SendCodeViewBodyContent extends StatelessWidget {
  const SendCodeViewBodyContent({
    super.key,
    required this.formKey,
    required this.controllerPinCode,
    this.onVerifyCodePressed,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controllerPinCode;
  final VoidCallback? onVerifyCodePressed;
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
                // -------------- Header ----------------
                const SendCodeHeader(),
                // -------------- body ----------------
                SendCodeFormSection(controllerPinCode: controllerPinCode),
                // -------------- Footer ----------------
                SendCodeFooterSection(
                  onPressed: onVerifyCodePressed,
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
