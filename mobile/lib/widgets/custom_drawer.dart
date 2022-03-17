import 'package:mobile/screens/history/history_screen.dart';
import 'package:mobile/screens/login/signin_screen.dart';
import 'package:mobile/screens/scan/transaction_screen.dart';
import 'package:mobile/screens/schedule/schedule_screen.dart';
import 'package:mobile/services/authentication_service/authentication_service.dart';
import 'package:mobile/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base/gradient_background.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GradientBackground(
        colors: const [PRIME_BLUE, ASCENT_BLUE],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
              child: Image.asset(
                'assets/icons/logo_full.png',
              ),
            ),
            ListTile(
              title: Text(
                'Perform scan action',
                style: GoogleFonts.montserrat(
                    color: PRIME_WHITE.withOpacity(0.8), fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TransactionScreen()));
              },
            ),
            const CustomDrawerIndicator(),
            ListTile(
              title: Text(
                'View working schedule',
                style: GoogleFonts.montserrat(
                    color: PRIME_WHITE.withOpacity(0.8), fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ScheduleScreen()));
              },
            ),
            const CustomDrawerIndicator(),
            ListTile(
              title: Text(
                'View working history',
                style: GoogleFonts.montserrat(
                    color: PRIME_WHITE.withOpacity(0.8), fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const HistoryScreen()));
              },
            ),
            const CustomDrawerIndicator(),
            ListTile(
              title: Text(
                'Log a report',
                style: GoogleFonts.montserrat(
                    color: PRIME_WHITE.withOpacity(0.8), fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const CustomDrawerIndicator(),
            ListTile(
              title: Text(
                'Sign out',
                style: GoogleFonts.montserrat(
                    color: PRIME_WHITE.withOpacity(0.8), fontSize: 16),
              ),
              onTap: () {
                AuthenticationService().signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignInScreen()),
                    ModalRoute.withName('/'));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomDrawerIndicator extends StatelessWidget {
  final double height;
  final Color color;

  const CustomDrawerIndicator({
    Key? key,
    this.height = 0.2,
    this.color = PRIME_LIGHT_GRAY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        height: height,
        margin: const EdgeInsets.only(left: 10, right: 30));
  }
}
