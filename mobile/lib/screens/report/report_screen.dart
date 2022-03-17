import 'package:mobile/screens/report/report_content.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: PRIME_WHITE,
        child: Column(
          children: [
            SizedBox(
              child: CustomAppBar(
                text: "Log a report",
                textColor: ABSOLUTE_WHITE,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              height: size.height * 0.07,
            ),
            ReportContent(
              height: size.height * 0.93,
            )
          ],
        ),
      ),
    );
  }
}
