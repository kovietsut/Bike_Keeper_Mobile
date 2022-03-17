import 'package:firebase_core/firebase_core.dart';
import 'package:mobile/blocs/transaction_bloc/bloc.dart';
import 'package:mobile/global/global_function.dart';
import 'package:mobile/screens/splash/splash_screen.dart';
import 'package:mobile/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await loadPath();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InitApp();
  }
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
          create: (context) => TransactionBloc(),
        )
      ],
      child: MaterialApp(
        title: "Bike Keeper",
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: PRIME_THEME_COLOR,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
