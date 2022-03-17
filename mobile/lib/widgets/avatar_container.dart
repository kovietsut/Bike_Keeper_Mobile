import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/base/base_ontap_widget.dart';
import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final double radius;
  final Color primary;
  final Color ascent;
  final ImageProvider assetImage;
  final EdgeInsets padding;
  final int borderSize;
  final Function()? onTap;

  const AvatarContainer({
    Key? key,
    this.radius = 34,
    this.primary = ABSOLUTE_WHITE,
    this.ascent = ASCENT_BLUE,
    required this.assetImage,
    this.padding = EdgeInsets.zero,
    this.borderSize = 3,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: BaseOnTapWidget(
        onTap: onTap,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primary,
          child: CircleAvatar(
            radius: radius - borderSize,
            backgroundColor: ascent,
            backgroundImage: assetImage,
          ),
        ),
      ),
    );
  }
}
