import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowSuffixPassword extends StatelessWidget {
  const ShowSuffixPassword({
    super.key,
    required this.isPassword,
    this.onToggleObscure,
    required this.suffixPath,
  });

  final bool isPassword;
  final VoidCallback? onToggleObscure;
  final String suffixPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: isPassword ? onToggleObscure : null,
        child: SizedBox(
          child: SvgPicture.asset(
            suffixPath,
            fit: BoxFit.contain,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
