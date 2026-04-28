import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NormalSuffix extends StatelessWidget {
  const NormalSuffix({super.key, required this.suffixPath});

  final String suffixPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SvgPicture.asset(suffixPath, fit: BoxFit.contain),
    );
  }
}
