import 'dart:convert';

import 'package:mobile/global/global_variable.dart';
import 'package:mobile/helpers/http_helper.dart';
import 'package:mobile/models/qualified_model.dart';
import 'package:mobile/models/transaction_model.dart';

class TransactionService {
  Future<TransactionModel?> create(QualifiedModel? data) async {
    if (data != null) {
      var rs = await HttpHelper.post(CREATE_TRANSACTION_ENDPOINT, data.toJson(),
          bearerToken: currentUser?.token);
      if (rs.statusCode == 200) {
        final jsonObject = jsonDecode(rs.body);
        if (jsonObject['isSuccess'] == 1) {
          return TransactionModel.fromJson(jsonObject['data']);
        }
      }
    }
    return null;
  }

  Future<String?> getTransactionType(String? qRCode) async {
    Map<String, dynamic> data = <String, dynamic>{};
    data['QRCode'] = qRCode;
    var rs = await HttpHelper.post(GET_TRANSACTION_TYPE_ENDPOINT, data,
        bearerToken: currentUser?.token);
    if (rs.statusCode == 200) {
      final jsonObject = jsonDecode(rs.body);
      if (jsonObject['isSuccess'] == 1) {
        return jsonObject['data']['transactionType'];
      }
    }
    return null;
  }
}
