import 'package:mobile/global/theme.dart';
import 'package:flutter/material.dart';

class ScheduleListViewRow extends StatelessWidget {
  final String title;
  final String fromTime;
  final String toTime;
  final Color color;

  const ScheduleListViewRow({
    Key? key,
    required this.title,
    required this.fromTime,
    required this.toTime,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = color == PRIME_WHITE ? ASCENT_BLUE : PRIME_WHITE;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(fromTime, style: TextStyle(color: textColor)),
              Text(toTime, style: TextStyle(color: textColor)),
            ],
          ),
        ],
      ),
    );
  }
}
