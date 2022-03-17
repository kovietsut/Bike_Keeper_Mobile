import 'package:mobile/screens/home/home_content.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      drawer: const CustomDrawer(),
      body: Container(
        color: ABSOLUTE_WHITE,
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                HomeHeader(height: 0.3 * size.height),
                HomeContent(height: 0.7 * size.height),
              ],
            ),
            Padding(
              child: IconButton(
                icon: const Icon(Icons.menu, size: 28),
                onPressed: () => _globalKey.currentState?.openDrawer(),
                color: ABSOLUTE_WHITE,
              ),
              padding: const EdgeInsets.only(
                  top: MAIN_LAYOUT_PADDING / 4, left: MAIN_LAYOUT_PADDING / 4),
            ),
          ],
        ),
      ),
    );
  }
}
