import 'package:flutter/material.dart';
import 'custom_animated_text.dart';
import 'custom_text_form_filed.dart';

class CustomInputFiled extends StatefulWidget {
  const CustomInputFiled({
    super.key,
    required this.text,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.textEditingController,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.suffixIconOff,
    this.isPassword = false,
  });

  final String text;
  final int? maxLines;
  final int? maxLength;
  final String hintText;
  final String? suffixIcon;
  final String? prefixIcon;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? suffixIconOff;
  final bool isPassword;

  @override
  State<CustomInputFiled> createState() => _CustomInputFiledState();
}

class _CustomInputFiledState extends State<CustomInputFiled> {
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;
  bool _obscureText = true;

  void _onTextChange() {
    final hasTextNow = widget.textEditingController.text.isNotEmpty;
    if (hasTextNow != _hasText) {
      setState(() => _hasText = hasTextNow);
    }
  }

  void _toggleObscure() => setState(() => _obscureText = !_obscureText);

  void _onFocusChange() => setState(() {});

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    widget.textEditingController.addListener(_onTextChange);
    _hasText = widget.textEditingController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasFocus = _focusNode.hasFocus;
    final double fontSize = hasFocus ? 14 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // text label
        CustomAnimatedText(
          fontSize: fontSize,
          hasFocus: hasFocus,
          widget: widget,
        ),
        const SizedBox(height: 8),
        CustomTextFormFiled(
          widget: widget,
          focusNode: _focusNode,
          hasText: _hasText,
          obscureText: _obscureText,
          onToggleObscure: _toggleObscure,
        ),
      ],
    );
  }
}
