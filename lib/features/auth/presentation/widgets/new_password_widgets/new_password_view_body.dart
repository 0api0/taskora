import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/widgets/custom_app_bar.dart';
import 'package:taskora/core/config/widgets/custom_button/custom_button.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';
import '../../../../../core/config/constants/color_manager.dart';
import '../../../../../core/router/routers_name.dart';
import 'new_password_form_section.dart';

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
      setState(() {});
      return;
    }
    final password = _controllerPassword.text;
    final confirmPassword = _controllerConfirmPassword.text;
    context.go(RoutersName.home);
    // TODO: Bloc
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingScaffold,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // ------------- Header -----------
                const CustomAppBar(title: AppStrings.titleCreateNewPassword),
                Text(
                  AppStrings.messgaesSubGreatPassword,
                  style: context.regular.copyWith(
                    color: ColorManager.textHintColor,
                  ),
                ),

                // ------------ form -----------
                NewPasswordFormSection(
                  controllerPassword: _controllerPassword,
                  controllerConfirmPassword: _controllerConfirmPassword,
                ),

                // ------------ footer --------------
                CustomButton(
                  text: AppStrings.buttonChangePassword,
                  onPressed: () {
                    _onChangePasswordPressed();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
