import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/features/auth/presentation/widgets/new_password_widgets/new_password_view_body_content.dart';
import '../../../../../core/router/routers_name.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  late final TextEditingController _controllerPassword;
  late final TextEditingController _controllerConfirmPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllerPassword = TextEditingController();
    _controllerConfirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerPassword.dispose();
    _controllerConfirmPassword.dispose();
    super.dispose();
  }

  void _onChangePasswordPressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final password = _controllerPassword.text;
    final confirmPassword = _controllerConfirmPassword.text;
    context.go(RoutersName.splashOnboardingRoute.home);
    // TODO: Bloc
  }

  @override
  Widget build(BuildContext context) {
    return NewPasswordViewBodyContent(
      formKey: _formKey,
      controllerPassword: _controllerPassword,
      controllerConfirmPassword: _controllerConfirmPassword,
      onChangePasswordPressed: _onChangePasswordPressed,
    );
  }
}
