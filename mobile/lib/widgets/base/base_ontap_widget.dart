import 'package:flutter/material.dart';

class BaseOnTapWidget extends StatelessWidget {
  final Function()? onTap;
  final Widget child;

  const BaseOnTapWidget({Key? key, this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: onTap,
    );
  }
}
