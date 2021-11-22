import 'package:intl/intl.dart';

class Measurement {
  late int idMeasurement;
  late int idMeasurementUnit;
  late int idMeasurementType;
  late int idMeasurementInfo;
  late int idDevice;
  late String mDatetime;
  late double value;
  late String unitName;
  late String unitSymbol;
  late String physicalQuantity;

  Measurement.fromJson(Map<String, dynamic> json) {
    idMeasurement = json['idMeasurement'];
    idMeasurementUnit = json['idMeasurementUnit'];
    idMeasurementType = json['idMeasurementType'];
    idMeasurementInfo = json['idMeasurementInfo'];
    idDevice = json['idDevice'];
    mDatetime = json['mDatetime'];
    value = json['value'];
    unitName = json['unitName'];
    unitSymbol = json['unitSymbol'];
    physicalQuantity = json['physicalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['idMeasurement'] = idMeasurement;
    data['idMeasurementUnit'] = idMeasurementUnit;
    data['idMeasurementType'] = idMeasurementType;
    data['idMeasurementInfo'] = idMeasurementInfo;
    data['idDevice'] = idDevice;
    data['mDatetime'] = mDatetime;
    data['value'] = value;
    data['unitName'] = unitName;
    data['unitSymbol'] = unitSymbol;
    data['physicalQuantity'] = physicalQuantity;

    return data;
  }

  String getDate() {
    final DateFormat formatter = DateFormat('dd.MM.yyyy.');
    final String dateString = formatter.format(DateTime.parse(mDatetime));

    return dateString;
  }

  String getTime() {
    final DateFormat formatter = DateFormat('HH:mm:ss');
    final String timeString = formatter.format(DateTime.parse(mDatetime));

    return timeString;
  }

  String getTimeHours() {
    final DateFormat formatter = DateFormat('HH');
    final String timeString = formatter.format(DateTime.parse(mDatetime));

    return timeString;
  }

  String getTimeMinutes() {
    final DateFormat formatter = DateFormat('mm');
    final String timeString = formatter.format(DateTime.parse(mDatetime));

    return timeString;
  }

  String getTimeSeconds() {
    final DateFormat formatter = DateFormat('ss');
    final String timeString = formatter.format(DateTime.parse(mDatetime));

    return timeString;
  }

  String getMeasurementData() {
    return '$value $unitSymbol';
  }
}
