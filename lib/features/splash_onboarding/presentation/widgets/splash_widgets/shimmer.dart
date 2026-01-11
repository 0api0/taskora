import 'package:flutter/material.dart';
import 'package:taskora/features/splash_onboarding/presentation/widgets/splash_widgets/sliding_gradient_transform.dart';

/// A lightweight shimmer effect without external packages.
/// Applies a moving highlight over the entire [child].
class Shimmer extends StatefulWidget {
  final Widget child;

  const Shimmer({super.key, required this.child});

  @override
  State<Shimmer> createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(milliseconds: 1200);

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Using AnimatedBuilder keeps rebuild scope minimal (Clean & performant).
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            // Move highlight from left -> right
            final double t = _controller.value; // 0..1
            final double dx = bounds.width * (2 * t - 1); // -w .. +w

            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [
                Color(0x00FFFFFF), // transparent
                Color(0x55FFFFFF), // highlight
                Color(0x00FFFFFF), // transparent
              ],
              stops: const [0.35, 0.5, 0.65],
              transform: SlidingGradientTransform(dx: dx),
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}
