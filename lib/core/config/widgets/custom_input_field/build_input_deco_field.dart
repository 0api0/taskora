import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskora/core/config/widgets/custom_input_field/suffix_icon/normal_suffix_icon.dart';
import 'package:taskora/core/config/widgets/custom_input_field/suffix_icon/password_suffix_icon.dart';

import 'custom_input_field.dart';

InputDecoration buildInputDecorationField({
  required bool showSuffixPassword,
  required String? suffixPath,
  required CustomInputFiled widget,
  required VoidCallback? onToggleObscure,
}) {
  return InputDecoration(
    prefixIconConstraints: const BoxConstraints(minWidth: 16, minHeight: 16),
    suffixIconConstraints: const BoxConstraints(minWidth: 16, minHeight: 16),
    prefixIcon: widget.prefixIcon == null
        ? null
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset(widget.prefixIcon!),
          ),
    suffixIcon: showSuffixPassword
        ? ShowSuffixPassword(
            isPassword: widget.isPassword,
            suffixPath: suffixPath!,
            onToggleObscure: onToggleObscure,
          )
        : (!widget.isPassword && suffixPath != null
              ? NormalSuffix(suffixPath: suffixPath)
              : null),
    hintText: widget.hintText,
  );
}
