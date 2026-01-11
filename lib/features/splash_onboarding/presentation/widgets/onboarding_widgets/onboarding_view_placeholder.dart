import 'package:flutter/material.dart';

class OnboardingPagePlaceholder extends StatelessWidget {
  final int index;

  const OnboardingPagePlaceholder({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page ${index + 1}'));
  }
}
