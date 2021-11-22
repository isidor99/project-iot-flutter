import 'package:dio/dio.dart';

import 'package:home_rpi/models/measurement_info.dart';
import 'package:home_rpi/services/dio_factory.dart';

class MeasurementInfoApiProvider {
  static Dio? dio = DioFactory.getInstance();

  static Future<List<MeasurementInfo>> getMeasurementsInfo(int idUser, int page) async {
    Response response = await dio!.get("/measurement-info/all/$idUser?page=$page");
    return (response.data as List).map((e) => MeasurementInfo.fromJson(e)).toList();
  }

  static Future<List<MeasurementInfo>> getDeviceMeasurementsInfo(int idDevice) async {
    Response response = await dio!.get("/measurement-info/$idDevice");
    return (response.data as List).map((e) => MeasurementInfo.fromJson(e)).toList();
  }
}
