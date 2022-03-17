import 'package:mobile/helpers/string_helper.dart';
import 'package:mobile/models/working_section_model.dart';

class WorkingScheduleModel {
  late List<WorkingSectionModel> workingSections;
  late DateTime startRange;
  late DateTime endRange;

  WorkingScheduleModel(this.workingSections, this.startRange, this.endRange);

  WorkingScheduleModel.fromJson(Map<String, dynamic> json) {
    startRange = StringHelper.stringToDateTime(json['startRange']);
    endRange = StringHelper.stringToDateTime(json['endRange']);
    if (json['workingSections'] != null) {
      workingSections = <WorkingSectionModel>[];
      json['workingSections'].forEach((value) {
        workingSections.add(WorkingSectionModel.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['startRange'] = StringHelper.datetimeToString(startRange);
    data['endRange'] = StringHelper.datetimeToString(endRange);
    data['workingSections'] = workingSections.map((e) => e.toJson()).toList();
    return data;
  }
}
