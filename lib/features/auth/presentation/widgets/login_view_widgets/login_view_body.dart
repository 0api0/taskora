import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'login_footer_section.dart';
import 'login_form_section.dart';
import 'login_header_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  //--------------- Var -------------------------
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  //--------------------- Init & dispose -----------------
  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  //----------------------- Fun for login view --------------------------
  void _onRememberMeChanged(bool value) {
    setState(() => _rememberMe = value);
  }

  void _onLoginPressed() {
    // LoginEvent(email, password, rememberMe)
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      setState(() {});
      return;
    }
    final email = _controllerEmail.text.trim();
    final password = _controllerPassword.text;
    //TODO: JUST TEST FOR FORGET PASSWORD
    context.push(RoutersName.authRoute.forgotPassword);
    // TODO: Bloc
  }

  void _onCreateAccountTap() {
    context.push(RoutersName.authRoute.signUp);
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
                const LoginHeaderSection(),
                LoginFormSection(
                  controllerEmail: _controllerEmail,
                  controllerPassword: _controllerPassword,
                ),
                LoginFooterSection(
                  onLoginPressed: _onLoginPressed,
                  onCreateAccountTap: _onCreateAccountTap,
                  rememberMe: _rememberMe,
                  onRememberMeChanged: _onRememberMeChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
