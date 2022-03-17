import 'package:mobile/helpers/string_helper.dart';

class AccountModel {
  late String userId;
  late String userName;
  late String userFullName;
  late String email;
  late String phoneNumber;
  // String expires;
  // DateTime expiresDate;
  late String uid;
  late String gender;
  late String status;
  late String address;
  late DateTime dateOfBirth;

  AccountModel(
    this.userId,
    this.userName,
    this.userFullName,
    this.email,
    this.phoneNumber,
    // this.expires,
    // this.expiresDate,
    this.uid,
    this.gender,
    this.status,
    this.address,
    this.dateOfBirth,
  );

  AccountModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userFullName = json['userFullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    // this.expires = json['expires'];
    // this.expiresDate = stringToDateTime(json['expiresDate']);
    uid = json['uid'];
    gender = json['gender'];
    status = json['status'];
    address = json['address'];
    dateOfBirth = StringHelper.stringToDateTime(json['dateOfBirth']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['userFullName'] = userFullName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    // data['expires'] = this.expires;
    // data['expiresDate'] = datetimeToString(this.expiresDate);
    data['uid'] = uid;
    data['gender'] = gender;
    data['status'] = status;
    data['address'] = address;
    data['dateOfBirth'] = StringHelper.datetimeToString(dateOfBirth);
    return data;
  }
}
