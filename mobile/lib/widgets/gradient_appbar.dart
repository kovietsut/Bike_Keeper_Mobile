import 'package:mobile/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base/gradient_background.dart';

class GradientAppBar extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final Color textColor;
  final double height;

  const GradientAppBar({
    Key? key,
    required this.colors,
    required this.title,
    required this.height,
    this.textColor = ABSOLUTE_WHITE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: GradientBackground(
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(
              vertical: 0.03 * MediaQuery.of(context).size.width),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 0.03 * MediaQuery.of(context).size.width,
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.arrow_back, color: textColor),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 0.05 * MediaQuery.of(context).size.width),
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
              )
            ],
          ),
        ),
        colors: colors,
      ),
      preferredSize: Size.fromHeight(height),
    );
  }
}
