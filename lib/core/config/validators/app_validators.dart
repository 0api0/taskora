import 'package:taskora/core/config/constants/app_strings.dart';

class AppValidators {
  static String? requiredField(String? value, {required String fieldLabel}) {
    final v = value?.trim() ?? "";
    if (v.isEmpty) return '$fieldLabel is required';
    return null;
  }

  static String? email(String? value) {
    final String label = AppStrings.validateEmail;
    // required field
    final errorRequired = requiredField(value, fieldLabel: label);
    if (errorRequired != null) return errorRequired;
    // Valid email
    final emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!emailRegex.hasMatch(value!)) return 'Enter a valid $label';
    return null;
  }

  static String? password(String? value, {int min = 8}) {
    final String label = AppStrings.validatePassword;
    // required field
    final errorRequired = requiredField(value, fieldLabel: label);
    if (errorRequired != null) return errorRequired;
    // Valid password
    if (value!.length < min) return '$label must be at least $min characters';
    return null;
  }

  static String? confirmPassword(
    String? value, {
    required String originalPassword,
  }) {
    final String label = AppStrings.formConfirmPassword;

    final String? errorRequired = requiredField(value, fieldLabel: label);
    if (errorRequired != null) {
      return errorRequired;
    }

    if (value!.trim() != originalPassword.trim()) {
      return AppStrings.validateConfirmPasswordNotMatch;
    }

    return null;
  }

  static String? doubleNumber(String? value, {required String fieldLabel}) {
    // required field
    final errorRequired = requiredField(value, fieldLabel: fieldLabel);
    if (errorRequired != null) return errorRequired;
    // Valid number
    final normalized = value!.replaceAll(',', '.');
    final parsed = double.tryParse(normalized);

    if (parsed == null) return '$fieldLabel must be a number';
    if (parsed < 0) return '$fieldLabel must be >= 0';
    return null;
  }

  static String? numberPinCode(String? value) {
    final String label = AppStrings.validatePinCode;
    // required field
    final errorRequired = requiredField(value, fieldLabel: label);
    if (errorRequired != null) return errorRequired;
    // Valid number
    final parsed = double.tryParse(value!);

    if (parsed == null) return '$label must be a number';
    if (value.length < 4) {
      return '$label must be 4 length';
    }
    return null;
  }

  static String? name(
    String? value, {
    required String fieldLabel,
    int min = 2,
  }) {
    // required field
    final errorRequired = requiredField(value, fieldLabel: fieldLabel);
    if (errorRequired != null) return errorRequired;
    // Valid name
    if (value!.length < min) {
      return '$fieldLabel must be at least $min characters';
    }
    return null;
  }
}
