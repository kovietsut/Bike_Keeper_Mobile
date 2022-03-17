import 'package:mobile/global/theme.dart';
import 'package:flutter/material.dart';

class LightShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const LightShadowContainer(
      {Key? key, required this.child, this.padding, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: ABSOLUTE_WHITE,
        border: Border.all(
            color: Colors.transparent, width: 1, style: BorderStyle.solid),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 3), // changes position of shadow
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
