import 'package:mobile/helpers/string_helper.dart';

class TransactionModel {
  late String message;
  // String position;
  late DateTime checkTime;

  TransactionModel(this.message, this.checkTime);

  TransactionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // this.position = json['position'];
    checkTime = StringHelper.stringToDateTime(json['checkTime']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    // data['position'] = this.position;
    data['checkTime'] = checkTime;
    return data;
  }
}
