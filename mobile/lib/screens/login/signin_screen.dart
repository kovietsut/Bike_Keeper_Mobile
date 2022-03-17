import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/helpers/firebase_helper.dart';
import 'package:mobile/screens/home/home_screen.dart';
import 'package:mobile/services/authentication_service/authentication_service.dart';
import 'package:mobile/widgets/loading_dialog.dart';
import 'package:mobile/global/theme.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ABSOLUTE_WHITE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [PRIME_BLUE, ASCENT_BLUE],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ).createShader(bounds);
              },
              child: Image.asset(
                "assets/icons/logo_break_down.png",
                width: size.width * MAIN_WIDTH_SCALE_RATE,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ABSOLUTE_WHITE),
                  foregroundColor: MaterialStateProperty.all<Color>(PRIME_GRAY),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: PRIME_LIGHT_GRAY,
                      ),
                      borderRadius: BorderRadius.circular(BORDER_RADIUS_BUTTON),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
                ),
                onPressed: () async {
                  LoadingDialog.showLoadingDialog(context,
                      text: "Loading your instance");
                  await FirebaseHelper().signInwithGoogle();
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    AuthenticationService()
                        .signin(user.email!, await user.getIdToken())
                        .then((value) {
                      print('$value');
                      LoadingDialog.hideLoadingDialog(context);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }, onError: (_) {
                      LoadingDialog.hideLoadingDialog(context);
                    });
                  }
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icons/icon_google_g.png",
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(fontSize: 20, color: PRIME_LIGHT_GRAY),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
