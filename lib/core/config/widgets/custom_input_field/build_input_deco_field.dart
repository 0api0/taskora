import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_input_field.dart';

InputDecoration buildInputDecorationField({
  required bool showSuffixPassword,
  required String suffixPath,
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
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: widget.isPassword ? onToggleObscure : null,
              child: SizedBox(
                child: SvgPicture.asset(
                  suffixPath,
                  fit: BoxFit.contain,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              child: SvgPicture.asset(
                // if not password field show any icon for field
                widget.isPassword ? '' : suffixPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
    hintText: widget.hintText,
  );
}
