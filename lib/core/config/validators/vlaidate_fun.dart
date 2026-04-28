import 'package:taskora/core/config/constants/app_strings.dart';

import 'app_validators.dart';

enum FieldType { name, email, password, hourly, field, pin }

String? validate(String? value, FieldType fieldType) {
  switch (fieldType) {
    case FieldType.email:
      return AppValidators.email(value);

    case FieldType.password:
      return AppValidators.password(value, min: 8);

    case FieldType.hourly:
      return AppValidators.doubleNumber(
        value,
        fieldLabel: AppStrings.validatePassword,
      );

    case FieldType.name:
      return AppValidators.name(
        value,
        fieldLabel: AppStrings.validateName,
        min: 2,
      );

    case FieldType.field:
      return AppValidators.requiredField(
        value,
        fieldLabel: AppStrings.validateField,
      );
    case FieldType.pin:
      return AppValidators.numberPinCode(value);
      return null;
  }
}
