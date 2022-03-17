// ignore_for_file: constant_identifier_names

import 'package:mobile/models/signin_model.dart';

enum KeepType {
  CheckedIn,
  CheckedOut,
}

String? tempPath;
const FIREBASE_PATH = "LicensePlate";
const FIREBASE_BUCKET = "gs://bike-keeper-3374e.appspot.com";

SigninModel? currentUser;

const DOMAIN = "localhost:44381";
