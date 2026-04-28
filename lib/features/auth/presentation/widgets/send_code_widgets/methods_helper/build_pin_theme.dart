import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/config/constants/color_manager.dart';

PinTheme get buildPinTheme {
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(8),
    fieldHeight: 56,
    fieldWidth: 50,
    borderWidth: 1,
    inactiveColor: ColorManager.textDarkColor,
    selectedColor: ColorManager.primaryColorApp,
    activeColor: ColorManager.statusGreenColor,
    errorBorderColor: ColorManager.statusRedColor,
    //
    inactiveFillColor: Colors.transparent,
    activeFillColor: Colors.transparent,
    selectedFillColor: Colors.transparent,
  );
}
