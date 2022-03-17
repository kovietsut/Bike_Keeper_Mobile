import 'package:flutter/material.dart';

class HeaderIconButton extends StatelessWidget {
  final Image image;
  final VoidCallback? onTap;
  final Text text;
  final EdgeInsets padding;

  const HeaderIconButton({
    Key? key,
    required this.image,
    this.onTap,
    required this.text,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      // ignore: deprecated_member_use
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        color: Colors.transparent,
        onPressed: onTap,
        child: Column(
          children: <Widget>[
            Center(child: image),
            const SizedBox(height: 10),
            text,
          ],
        ),
      ),
    );
  }
}
