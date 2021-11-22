import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'package:home_rpi/services/dio_factory.dart';
import 'package:home_rpi/models/measurement.dart';

class MeasurementApiProvider {
  static DateFormat apiDateFormat = DateFormat('yyyy-MM-dd');

  static Future<List<Measurement>> getMeasurements(int idMeasurementInfo, int page) async {
    Dio? dio = DioFactory.getInstance();
    Response response = await dio!.get("/measurement/$idMeasurementInfo?page=$page");

    return (response.data as List).map((e) => Measurement.fromJson(e)).toList();
  }

  static Future<List<Measurement>> getMeasurementsByDate(
      int idMeasurementInfo, String? dDate, int page) async {
    Dio? dio = DioFactory.getInstance();
    Response response = await dio!.get("/measurement/$idMeasurementInfo/date/$dDate?page=$page");

    return (response.data as List).map((e) => Measurement.fromJson(e)).toList();
  }

  static Future<List<Measurement>> getMeasurementsByMonth(
      int idMeasurementInfo, int? month, int page) async {
    Dio? dio = DioFactory.getInstance();
    Response response = await dio!.get("/measurement/$idMeasurementInfo/month/$month?page=$page");

    return (response.data as List).map((e) => Measurement.fromJson(e)).toList();
  }
}
