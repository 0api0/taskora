import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/color_manager.dart';
import 'custom_input_field.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.widget,
    required FocusNode focusNode,
    required this.obscureText,
    required this.hasText,
    required this.onToggleObscure,
  }) : _focusNode = focusNode;

  final CustomInputFiled widget;
  final FocusNode _focusNode;
  final bool obscureText;
  final bool hasText;
  final VoidCallback onToggleObscure;

  @override
  Widget build(BuildContext context) {
    final showSuffix = widget.isPassword!
        ? hasText
        : (widget.suffixIcon != null);

    final suffixPath = widget.isPassword!
        ? (obscureText
              ? (widget.suffixIcon ?? '')
              : (widget.suffixIconOff ?? widget.suffixIcon ?? ''))
        : (widget.suffixIcon ?? '');
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword! ? obscureText : false,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(
          minWidth: 16,
          minHeight: 16,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 16,
          minHeight: 16,
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(widget.prefixIcon!),
              ),
        suffixIcon: showSuffix
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: widget.isPassword! ? onToggleObscure : null,
                  child: SizedBox(
                    child: SvgPicture.asset(
                      suffixPath,
                      fit: BoxFit.contain,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              )
            : null,
        hintText: widget.hintText,
      ),
    );
  }
}
