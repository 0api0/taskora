import 'package:flutter/material.dart';
import 'build_input_deco_field.dart';
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
    /* show suffix password
     If password field
    * true : => if has text (true : => show suffix icon -hide pass- , false : => not show)
    * false : show suffix icon for any field
    * */
    final showSuffixPassword = widget.isPassword ? hasText : false;

    /* suffix path
    if showSuffixPassword
    *  true : => if obscure text (true : show icon hide pass , false : show icon un hide pass)
    * false : => show icon for any field
    * */
    final suffixPath = showSuffixPassword
        ? (obscureText ? (widget.suffixIcon) : (widget.suffixIconOff))
        : (widget.suffixIcon);
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? obscureText : false,
      decoration: buildInputDecorationField(
        showSuffixPassword: showSuffixPassword,
        suffixPath: suffixPath ?? '',
        onToggleObscure: onToggleObscure,
        widget: widget,
      ),
    );
  }
}
