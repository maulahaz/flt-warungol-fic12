import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MyGlassmorphic extends StatelessWidget {
  final double width, height;
  final double borderRadius;
  final Widget child;
  const MyGlassmorphic(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: borderRadius,
      blur: 20,
      border: 0,
      linearGradient: LinearGradient(colors: [
        Color(0xffffff).withOpacity(0.1),
        Color(0xffffff).withOpacity(0.05),
      ]),
      borderGradient: LinearGradient(colors: [
        Color(0xffffff).withOpacity(0.5),
        Color(0xffffff).withOpacity(0.5),
      ]),
      child: child,
    );
  }
}
