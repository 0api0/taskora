import 'app_validators.dart';

enum FieldType { name, email, password, hourly, field, pin }

String? validate(String? value, FieldType fieldType) {
  // In enum (ex : fieldType.name but i need after fieldType. as a string )
  final label = fieldType.toString().substring(10) ?? 'Field';

  switch (fieldType) {
    case FieldType.email:
      return AppValidators.email(value);

    case FieldType.password:
      return AppValidators.password(value, min: 8);

    case FieldType.hourly:
      return AppValidators.doubleNumber(value, fieldLabel: label);

    case FieldType.name:
      return AppValidators.name(value, fieldLabel: label, min: 2);

    case FieldType.field:
      return AppValidators.requiredField(value, fieldLabel: label);
    case FieldType.pin:
      return AppValidators.numberPinCode(value);
      return null;
  }
}
