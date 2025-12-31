import 'package:flutter/material.dart';
import 'package:taskora/core/config/constants/app_strings.dart';
import 'package:taskora/core/config/constants/image_path.dart';
import 'package:taskora/core/theme/light_theme.dart';
import 'core/config/widgets/custom_body_error.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDataLight.themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: CustomBodyError(
              image: ImagePath.internetError,
              title: AppStrings.messgaesNoInternetConnection,
              subTitle: AppStrings.messgaesSubNoInternetConnection,
              textButton: AppStrings.buttonRetry,
              textButtonOutline: AppStrings.buttonGoToSetting,
              onPressed: () {},
              onPressedOutline: () {},
            ),
          ),
        ),
      ),
    );
  }
}
