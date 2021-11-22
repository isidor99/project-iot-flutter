class Device {
  late int idDevice;
  late String deviceName;
  late String shortDescription;
  late String description;
  late int idUser;

  Device.fromJson(Map<String, dynamic> json) {
    idDevice = json['idDevice'];
    deviceName = json['deviceName'];
    shortDescription = json['shortDescription'];
    description = json['description'] ?? "DESC";
    idUser = json['idUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['idDevice'] = idDevice;
    data['deviceName'] = deviceName;
    data['shortDescription'] = shortDescription;
    data['description'] = description;
    data['idUser'] = idUser;

    return data;
  }
}
