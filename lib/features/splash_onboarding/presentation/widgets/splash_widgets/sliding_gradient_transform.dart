import 'package:flutter/material.dart';

class SlidingGradientTransform extends GradientTransform {
  final double dx;

  const SlidingGradientTransform({required this.dx});

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(dx, 0.0, 0.0);
  }
}
