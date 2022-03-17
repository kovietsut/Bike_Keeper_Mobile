class CompanyModel {
  late int id;
  late String code, name, location;
  late bool enable;

  CompanyModel(this.id, this.code, this.name, this.location, this.enable);

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    location = json['location'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['location'] = location;
    data['enable'] = enable;
    return data;
  }
}
