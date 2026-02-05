import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_footer_section.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_form_section.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_header_section.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  //------------ Var ------------
  late final TextEditingController _controllerName;
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  late final TextEditingController _controllerHourlyRate;
  final _formKey = GlobalKey<FormState>();

  //------------ init & dis  ------------
  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerHourlyRate = TextEditingController();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerHourlyRate.dispose();
    super.dispose();
  }

  //------------ Fun for Create account view ------------

  void _onCreateAccountPressed() {
    // LoginEvent(name ,email, password, hourly rate)
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final name = _controllerName.text;
    final email = _controllerEmail.text.trim();
    final password = _controllerPassword.text;
    final hourlyRate = _controllerHourlyRate.text;
    context.pop();
    // TODO: Bloc
  }

  void _onLoginTap() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingScaffold,
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SignUpHeaderSection(),
                SignUpFormSection(
                  controllerName: _controllerName,
                  controllerEmail: _controllerEmail,
                  controllerPassword: _controllerPassword,
                  controllerHourlyRate: _controllerHourlyRate,
                ),
                SignUpFooterSection(
                  onCreateAccountPressed: _onCreateAccountPressed,
                  onLoginTap: _onLoginTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
