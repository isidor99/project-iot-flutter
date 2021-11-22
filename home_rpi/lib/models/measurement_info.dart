class MeasurementInfo {
  late int idMeasurementInfo;
  late int idDevice;
  late int idMeasurementType;
  late int idMeasurementUnit;
  late int idUser;
  late String deviceName;
  late String physicalQuantityName;
  late String description;

  MeasurementInfo.fromJson(Map<String, dynamic> json) {
    idMeasurementInfo = json['idMeasurementInfo'];
    idDevice = json['idDevice'];
    idMeasurementType = json['idMeasurementType'];
    idMeasurementUnit = json['idMeasurementUnit'];
    idUser = json['idUser'];
    deviceName = json['deviceName'];
    physicalQuantityName = json['physicalQuantityName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['idMeasurementInfo'] = idMeasurementInfo;
    data['idDevice'] = idDevice;
    data['idMeasurementType'] = idMeasurementType;
    data['idMeasurementUnit'] = idMeasurementUnit;
    data['idUser'] = idUser;
    data['deviceName'] = deviceName;
    data['physicalQuantityName'] = physicalQuantityName;
    data['description'] = description;

    return data;
  }
}
