import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/auth/presentation/widgets/send_code_widgets/send_code_view_body_content.dart';

class SendCodeViewBody extends StatefulWidget {
  const SendCodeViewBody({super.key});

  @override
  State<SendCodeViewBody> createState() => _SendCodeViewBodyState();
}

class _SendCodeViewBodyState extends State<SendCodeViewBody> {
  late final TextEditingController _controllerPinCode;
  final _formKey = GlobalKey<FormState>();

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

  void _onVerifyCodePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final pinCode = _controllerPinCode.text.trim();
    context.push(RoutersName.authRoute.newPassword);
    // TODO: Bloc
  }

  @override
  Widget build(BuildContext context) {
    return SendCodeViewBodyContent(
      isLoading:, controllerPinCode: _controllerPinCode,
      formKey: _formKey,
      onVerifyCodePressed: _onVerifyCodePressed,);
  }
}
