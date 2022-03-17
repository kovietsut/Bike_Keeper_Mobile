import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/global/global_function.dart';
import 'package:mobile/global/global_variable.dart';
import 'package:mobile/helpers/firebase_helper.dart';
import 'package:mobile/helpers/http_helper.dart';
import 'package:mobile/helpers/local_helper.dart';
import 'package:mobile/models/signin_model.dart';

class AuthenticationService {
  Future<bool> load() async {
    await getGlobal();
    return currentUser != null;
  }

  Future<SigninModel?> getCurrentSignin() async {
    var rs = await LocalHelper.getAccountFromLocal();
    currentUser = rs;
    return currentUser;
  }

  Future<SigninModel?> signin(String email, String tokenId) async {
    Map<String, String> accountInput = {
      "Email": email,
      "TokenId": tokenId,
    };
    var rs = await HttpHelper.post(SIGN_IN_WITH_GOOGLE_ENDPOINT, accountInput);
    print(rs);
    print("tao đăng nhập được rồi. đm");
    if (rs.statusCode == 200) {
      final jsonObject = jsonDecode(rs.body);
      var data = jsonObject['data'];
      final user = FirebaseAuth.instance.currentUser;
      data['imgUrl'] = user?.photoURL;
      var account = SigninModel.fromJson(data);
      currentUser = account;
      LocalHelper.saveAccountToLocal(account);
      return account;
    }
    return null;
  }

  Future signOut() async {
    FirebaseHelper().signOutFromGoogle();
    currentUser = null;
    return await LocalHelper.deleteAccountFromLocal();
  }
}
