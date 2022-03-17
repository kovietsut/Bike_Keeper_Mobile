import 'package:mobile/models/company_model.dart';

import 'account_model.dart';

class SigninModel {
  late AccountModel account;
  late String token;
  late Map<String, dynamic> role;
  late String imgUrl;
  late CompanyModel company;

  SigninModel(this.account, this.token, this.role, this.imgUrl, this.company);

  SigninModel.fromJson(Map<String, dynamic> json) {
    account = AccountModel.fromJson(json['account']);
    token = json['token'];
    role = json['role'];
    imgUrl = json['imgUrl'];
    company = CompanyModel.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account'] = account.toJson();
    data['token'] = token;
    data['role'] = role;
    data['imgUrl'] = imgUrl;
    data['company'] = company.toJson();

    return data;
  }
}
