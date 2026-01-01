import 'package:flutter/material.dart';
import 'package:taskora/core/config/widgets/custom_app_bar.dart';
import 'package:taskora/core/config/widgets/custom_button/custom_button.dart';
import 'package:taskora/core/extensions/padding_extension.dart';
import 'package:taskora/core/theme/light_theme.dart';

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
          child: Padding(
            padding: context.paddingScaffold,
            child: const Column(
              children: [
                CustomAppBar(title: 'title'),
                CustomButton(text: 'text'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
