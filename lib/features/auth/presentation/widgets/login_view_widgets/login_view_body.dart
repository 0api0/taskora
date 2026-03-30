import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/auth/presentation/widgets/login_view_widgets/login_view_body_content.dart';

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
    return LoginViewBodyContent(
      formKey: _formKey,
      controllerEmail: _controllerEmail,
      controllerPassword: _controllerPassword,
      rememberMe: _rememberMe,
      onRememberMeChanged: _onRememberMeChanged,
      onLoginPressed: _onLoginPressed,
      onCreateAccountTap: _onCreateAccountTap,
    );
  }
}
