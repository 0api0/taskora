import 'package:flutter/material.dart';

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
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
      ),
    );
  }
}
