import 'package:flutter/material.dart';
import 'package:taskora/core/router/router.dart';
import 'package:taskora/core/theme/light_theme.dart';

import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeDataLight.themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
