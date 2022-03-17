import 'package:mobile/widgets/light_shadow_container.dart';
import 'package:flutter/material.dart';

class ReportContent extends StatelessWidget {
  final double height;

  const ReportContent({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Column(
          children: const [
            LightShadowContainer(
                child: TextField(
              decoration: InputDecoration(),
            ))
          ],
        ));
  }
}
