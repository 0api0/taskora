import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:taskora/features/auth/presentation/widgets/login_view_widgets/login_view_body_content.dart';

import '../../../params/login_params.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';

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
    context.read<AuthBloc>().add(
      LoginRequested(
        LoginParams(email: email, password: password, rememberMe: _rememberMe),
      ),
    );
  }

  void _onCreateAccountTap() {
    context.push(RoutersName.authRoute.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if ((state.status == AuthStatus.failure ||
                state.status == AuthStatus.networkFailure) &&
            state.message != null &&
            state.message!.isNotEmpty) {
          context.push(
            RoutersName.authRoute.bodyError,
            extra: {'message': state.message, 'authStatus': state.status},
          );
        }

        if (state.status == AuthStatus.unauthenticated &&
            state.message != null &&
            state.message!.isNotEmpty) {
          context.push(RoutersName.authRoute.forgotPassword);
        }

        if (state.status == AuthStatus.authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged in successfully')),
          );

          context.go(RoutersName.splashOnboardingRoute.home);
        }
      },
      builder: (context, state) {
        return LoginViewBodyContent(
          formKey: _formKey,
          controllerEmail: _controllerEmail,
          controllerPassword: _controllerPassword,
          rememberMe: _rememberMe,
          onRememberMeChanged: _onRememberMeChanged,
          onLoginPressed: _onLoginPressed,
          onCreateAccountTap: _onCreateAccountTap,
        );
      },
    );
  }
}
