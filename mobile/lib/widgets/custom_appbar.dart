import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/base/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onTap;
  final Color textColor;
  final String text;

  const CustomAppBar({
    Key? key,
    this.onTap,
    this.textColor = PRIME_WHITE,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      colors: const [PRIME_BLUE, ASCENT_BLUE],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: MAIN_LAYOUT_PADDING / 4,
                left: MAIN_LAYOUT_PADDING / 4,
                bottom: MAIN_LAYOUT_PADDING / 4),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: textColor,
                  size: 24,
                ),
                onPressed: onTap),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: MAIN_LAYOUT_PADDING,
                top: MAIN_LAYOUT_PADDING / 4,
                bottom: MAIN_LAYOUT_PADDING / 4),
            child: Text(
              text,
              style: GoogleFonts.montserrat(color: textColor, fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
