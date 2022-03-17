// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDL2EwjS4uQd_IW80LjJsB7ZJ4Fx8pO-bM',
    appId: '1:156196961698:web:e50e6c9265d6a3538d46fb',
    messagingSenderId: '156196961698',
    projectId: 'bike-keeper-3374e',
    authDomain: 'bike-keeper-3374e.firebaseapp.com',
    databaseURL: 'https://bike-keeper-3374e-default-rtdb.firebaseio.com',
    storageBucket: 'bike-keeper-3374e.appspot.com',
    measurementId: 'G-Y7VBXCLJB0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDe-pFwDrVZZz_diUnptvWAqvG_YfZiUmo',
    appId: '1:156196961698:android:f78926906f8e4d278d46fb',
    messagingSenderId: '156196961698',
    projectId: 'bike-keeper-3374e',
    databaseURL: 'https://bike-keeper-3374e-default-rtdb.firebaseio.com',
    storageBucket: 'bike-keeper-3374e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz2jYY0BogOoyHl7lZKk8yMeqCM-XS6_M',
    appId: '1:156196961698:ios:437bedf54f8833658d46fb',
    messagingSenderId: '156196961698',
    projectId: 'bike-keeper-3374e',
    databaseURL: 'https://bike-keeper-3374e-default-rtdb.firebaseio.com',
    storageBucket: 'bike-keeper-3374e.appspot.com',
    androidClientId: '156196961698-pul3opkklb3f13p15qdgt1o36ddc0f06.apps.googleusercontent.com',
    iosClientId: '156196961698-je0uup5t350k1puup0sq5870efncu3j4.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobile',
  );
}