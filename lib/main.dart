import 'package:flutter/material.dart';
import 'package:taskora/core/config/widgets/custom_button/custom_button.dart';
import 'package:taskora/core/config/widgets/custom_button_icon/custom_button_with_icon.dart';
import 'package:taskora/core/theme/light_theme.dart';

import 'core/config/widgets/custom_input_field/custom_input_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();
    return MaterialApp(
      theme: ThemeDataLight.themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            // text filed
            CustomInputFiled(
              text: 'Email',
              prefixIcon: const Icon(Icons.email),
              hintText: 'hint here',
              textEditingController: textEditingController,
              maxLength: 20,
              keyboardType: TextInputType.twitter,
            ),
            CustomInputFiled(
              text: 'Password',
              prefixIcon: const Icon(Icons.password),
              suffixIcon: const Icon(Icons.camera_alt),
              hintText: 'hint here',
              textEditingController: textEditingController2,
            ),
            const SizedBox(height: 20),

            // buttons State
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButtonWithIcon(
                onPressed: () {},
                isDashed: true,
                text: 'Button dashed with icon ',
                icon: Icons.ac_unit,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButtonWithIcon(
                onPressed: () {},
                text: 'Button with icon ',
                icon: Icons.ac_unit,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(onPressed: () {}, text: 'Button enabled'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomButton(onPressed: null, text: 'Button disabled'),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {},
                text: 'Button outline',
                isOutline: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
