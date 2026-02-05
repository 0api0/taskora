import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskora/core/config/constants/color_manager.dart';
import 'package:taskora/core/extensions/text_style_extension.dart';

import '../../../../../core/config/validators/vlaidate_fun.dart';
import 'methods_helper/build_pin_theme.dart';

class SendCodeFormSection extends StatelessWidget {
  const SendCodeFormSection({super.key, required this.controllerPinCode});

  final TextEditingController controllerPinCode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: controllerPinCode,
      // just parent class has controller (can init or dis)
      // if child class has controller from parent do dis controller (this make error)
      autoDisposeControllers: false,
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      cursorColor: ColorManager.primaryColorApp,
      enableActiveFill: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validate
      validator: (value) => validate(value, FieldType.pin),
      inputFormatters: [
        // just input number
        FilteringTextInputFormatter.allow(RegExp(r'^\d*([]\d*)?$')),
      ],
      pastedTextStyle: context.bold.copyWith(
        color: ColorManager.statusOrangeColor,
      ),
      /*
      if user need paste text has length > 4 or need paste any char not number
      => no any action
      just < 4 and number
      */
      beforeTextPaste: (text) {
        FilteringTextInputFormatter filtering =
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([]\d*)?$'));
        if (text!.length > 4 || filtering.allow) {
          return false;
        }
        return true;
      },
      pinTheme: buildPinTheme,
    );
  }
}
