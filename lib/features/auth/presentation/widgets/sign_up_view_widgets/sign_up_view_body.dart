import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/features/auth/params/register_params.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_event.dart';
import 'package:taskora/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:taskora/features/auth/presentation/widgets/sign_up_view_widgets/sign_up_view_body_content.dart';
import '../../../../../core/router/routers_name.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  //------------ Var ------------
  late final TextEditingController _controllerName;
  late final TextEditingController _controllerUserName;
  late final TextEditingController _controllerEmail;
  late final TextEditingController _controllerPassword;
  late final TextEditingController _controllerHourlyRate;
  final _formKey = GlobalKey<FormState>();

  //------------ init & dis  ------------
  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerUserName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerHourlyRate = TextEditingController();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerUserName.dispose();
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
    final userName = _controllerUserName.text;
    final email = _controllerEmail.text.trim();
    final password = _controllerPassword.text;
    final hourlyRate = _controllerHourlyRate.text;
    context.read<AuthBloc>().add(
      RegisterRequested(
        RegisterParams(
          name: name,
          email: email,
          username: userName,
          password: password,
          watchCost: hourlyRate,
        ),
      ),
    );
  }

  void _onLoginTap() {
    context.pop();
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
            extra: {
              'message': state.message,
              'status': state.status,
              'errors': state.validationErrors,
            },
          );
        }

        if (state.status == AuthStatus.success &&
            state.message != null &&
            state.message!.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));

          context.pop();
        }
      },
      builder: (context, state) {
        return SignUpViewBodyContent(
          formKey: _formKey,
          controllerName: _controllerName,
          controllerUserName: _controllerUserName,
          controllerEmail: _controllerEmail,
          controllerPassword: _controllerPassword,
          controllerHourlyRate: _controllerHourlyRate,
          onCreateAccountPressed: _onCreateAccountPressed,
          onLoginTap: _onLoginTap,
        );
      },
    );
  }
}
