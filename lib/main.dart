import 'package:flutter/material.dart';
import 'package:taskora/core/theme/light_theme.dart';
import 'core/config/widgets/custom_app_bar.dart';
import 'core/config/widgets/custom_rich_text.dart';

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
          child: Column(
            children: [
              const CustomAppBar(title: 'Create account'),
              const SizedBox(height: 24),
              CustomRichTextRow(
                text: "Don't have an account? ",
                actionText: "Create an account",
                onTap: () {
                  print('on tap *****************************************');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
