import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/screens/login/signin_screen.dart';
import 'package:mobile/global/theme.dart';
import 'package:mobile/widgets/base/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:mobile/services/authentication_service/authentication_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      AuthenticationService().load().then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    value ? const HomeScreen() : const SignInScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: GradientBackground(
        height: size.height,
        width: size.width,
        colors: const [PRIME_BLUE, ASCENT_BLUE],
        child: Center(
            child: Image.asset(
          'assets/icons/logo_b.png',
          width: 120,
          height: 120,
        )),
      ),
    );
  }
}
