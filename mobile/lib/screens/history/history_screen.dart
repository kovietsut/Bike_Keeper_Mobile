import 'history_content.dart';
import 'package:mobile/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: CustomAppBar(
              text: "Working History",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            height: size.height * 0.07,
          ),
          HistoryContent(
            height: size.height * 0.93,
          ),
        ],
      ),
    );
  }
}
