class QualifiedModel {
  String? transactionType,
      qRCode,
      vehicleManufacturer,
      vehicleColor,
      imageVehicle,
      licensePlate,
      url;

  QualifiedModel(this.transactionType, this.qRCode, this.vehicleManufacturer,
      this.vehicleColor, this.imageVehicle, this.licensePlate, this.url);

  QualifiedModel.fromJson(Map<String, dynamic> json) {
    transactionType = json['TransactionType'];
    qRCode = json['QRCode'];
    vehicleManufacturer = json['VehicleManufacturer'];
    vehicleColor = json['VehicleColor'];
    imageVehicle = json['ImageVehicle'];
    licensePlate = json['LicensePlate'];
    url = json['Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TransactionType'] = transactionType;
    data['QRCode'] = qRCode;
    data['VehicleManufacturer'] = vehicleManufacturer;
    data['VehicleColor'] = vehicleColor;
    data['ImageVehicle'] = imageVehicle;
    data['LicensePlate'] = licensePlate;
    data['Url'] = url;
    return data;
  }
}
