// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:mobile/global/global_variable.dart';
import 'package:http/http.dart' as http;

const USER_DOMAIN = "Users";
const SIGNIN_ENDPOINT = DOMAIN + "api/Users/SignIn";
const SCHEDULE_ENDPOINT = DOMAIN + "schedule";
const HISTORY_ENDPOINT = DOMAIN + "history";
const SIGN_IN_WITH_GOOGLE_ENDPOINT = "api/Users/SignInWithGoogle";
const CREATE_TRANSACTION_ENDPOINT = "api/Park_Transaction/Create";
const GET_TRANSACTION_TYPE_ENDPOINT = "api/Park_Transaction/CheckQR";

class HttpHelper {
  static Future<http.Response> post(String url, Map<String, dynamic> body,
      {String? bearerToken}) async {
        print(body.toString());
    return (await http
        .post(Uri.http(DOMAIN, url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
    }));
  }

  static Future<http.Response> put(String url, Map<String, dynamic> body,
      {String? bearerToken}) async {
    return (await http
        .put(Uri.https(DOMAIN, url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
    }));
  }

  static Future<http.Response> get(String url, {String? bearerToken}) async {
    return await http.get(Uri.https(DOMAIN, url),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $bearerToken'});
  }
}
