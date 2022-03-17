import 'schedule_content.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: PRIME_WHITE,
        child: Column(
          children: [
            SizedBox(
              child: CustomAppBar(
                text: "Working Schedule",
                textColor: ABSOLUTE_WHITE,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height: size.height * 0.07,
            ),
            ScheduleContent(
              height: size.height * 0.93,
            )
          ],
        ),
      ),
    );
  }
}
