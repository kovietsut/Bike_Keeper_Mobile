import 'dart:io';

import 'package:mobile/global/global_variable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static FirebaseStorage? storage;

  Future<void> signInwithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  static void initStorageInstance() {
    storage = FirebaseStorage.instanceFor(bucket: FIREBASE_BUCKET);
  }

  static Future<void> pushFile(path, filename) async {
    if (storage == null) {
      throw Exception("Push image to firebase storage fail");
    }
    storage?.ref().child(FIREBASE_PATH + '/' + filename).putFile(File(path));
  }
}
