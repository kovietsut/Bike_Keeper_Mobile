// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:mobile/models/signin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static saveAccountToLocal(SigninModel accountModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var rs =
        await pref.setString('login', jsonEncode(accountModel)); // static value
  }

  static deleteAccountFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var rs = await pref.remove('login'); // static value
  }

  static Future<SigninModel?> getAccountFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var account = pref.getString('login');
    if (account != null) {
      return SigninModel.fromJson(jsonDecode(account));
    }
    return null;
  }
}
