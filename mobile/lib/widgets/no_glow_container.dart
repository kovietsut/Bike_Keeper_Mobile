import 'package:flutter/material.dart';

class NoGlowContainer extends StatelessWidget {
  final Widget child;

  const NoGlowContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      // ignore: missing_return
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
