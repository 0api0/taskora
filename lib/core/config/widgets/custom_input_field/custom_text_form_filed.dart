import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_input_field.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.widget,
    required FocusNode focusNode,
  }) : _focusNode = focusNode;

  final CustomInputFiled widget;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
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
        suffixIcon: widget.suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(widget.suffixIcon!),
              ),
        hintText: widget.hintText,
      ),
    );
  }
}
