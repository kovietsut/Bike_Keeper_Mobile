import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final double? height;
  final double? width;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsets? padding;

  const GradientBackground({
    Key? key,
    required this.colors,
    this.height,
    this.width,
    this.padding,
    required this.child,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      padding: padding,
      height: height,
      width: width,
      child: child,
    );
  }
}
