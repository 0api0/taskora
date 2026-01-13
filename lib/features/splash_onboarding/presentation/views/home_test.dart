import 'package:flutter/material.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home test', style: context.extraBold)),
    );
  }
}
