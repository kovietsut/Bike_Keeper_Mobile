import 'package:mobile/global/global_variable.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/light_shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryRecordRow extends StatelessWidget {
  final String plate;
  final KeepType status;
  final VoidCallback? onTap;

  const HistoryRecordRow({
    Key? key,
    required this.plate,
    this.status = KeepType.CheckedIn,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;
    switch (status) {
      case KeepType.CheckedIn:
        color = PRIME_BLUE;
        text = "Checked in";
        break;
      case KeepType.CheckedOut:
        color = PRIME_GRAY;
        text = "Checked out";
        break;
    }
    var fontStyle = GoogleFonts.montserrat(color: color);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: MAIN_LAYOUT_PADDING / 4),
        child: TextButton(
          onPressed: onTap,
          child: LightShadowContainer(
            padding:
                const EdgeInsets.symmetric(vertical: MAIN_LAYOUT_PADDING / 2),
            child: Row(
              children: [
                Expanded(child: Container(), flex: 1),
                Expanded(
                    child: Text(plate,
                        style: GoogleFonts.montserrat(color: PRIME_BLUE)),
                    flex: 6),
                Expanded(child: Container(), flex: 1),
                Expanded(child: Text(text, style: fontStyle), flex: 4),
                Expanded(child: Container(), flex: 1),
              ],
            ),
          ),
        ));
  }
}
