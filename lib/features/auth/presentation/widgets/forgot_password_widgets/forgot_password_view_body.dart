import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/router/routers_name.dart';
import '../../../../../core/config/constants/app_strings.dart';
import '../../../../../core/config/constants/image_path.dart';
import '../../../../../core/config/widgets/custom_body_error.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyError(
      image: ImagePath.loginError,
      title: AppStrings.messgaesLoginFailed,
      subTitle: AppStrings.messgaesSubLoginFailed,
      textButton: AppStrings.buttonTryAgain,
      textButtonOutline: AppStrings.buttonForgetPass,
      onPressedOutline: () {
        context.push(RoutersName.authRoute.resetPassword);
      },
      onPressed: () {
        context.pop();
      },
    );
  }
}
