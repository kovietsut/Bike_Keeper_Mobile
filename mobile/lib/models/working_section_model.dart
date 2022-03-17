import 'package:mobile/helpers/string_helper.dart';

class WorkingSectionModel {
  late DateTime startTime;
  late DateTime endTime;
  late String label;

  WorkingSectionModel(this.startTime, this.endTime, this.label);

  WorkingSectionModel.fromJson(Map<String, dynamic> json) {
    startTime = StringHelper.stringToDateTime(json['startDate']);
    endTime = StringHelper.stringToDateTime(json['endDate']);
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['startTime'] = StringHelper.datetimeToString(startTime);
    data['endTime'] = StringHelper.datetimeToString(endTime);
    data['label'] = label;
    return data;
  }
}
