import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskora/core/extensions/sizes_extension.dart';

import '../../../../core/config/constants/app_strings.dart';
import '../../../../core/config/constants/image_path.dart';
import '../../../../core/config/widgets/custom_body_error.dart';
import '../../../../core/router/routers_name.dart';

//TODO: later refactor Code
class ErrorViewTest extends StatelessWidget {
  const ErrorViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingScaffold,
        child: CustomBodyError(
          image: ImagePath.serverError,
          title: 'Page not found',
          subTitle: "",
          textButton: AppStrings.buttonTryAgain,
          textButtonOutline: AppStrings.buttonContactSupport,
          onPressedOutline: () {
            // TODO: go to support
          },
          onPressed: () {
            context.go(RoutersName.splash);
          },
        ),
      ),
    );
  }
}
