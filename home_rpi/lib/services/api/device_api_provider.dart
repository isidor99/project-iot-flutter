import 'package:dio/dio.dart';

import 'package:home_rpi/models/device.dart';
import 'package:home_rpi/services/dio_factory.dart';

class DeviceApiProvider {
  static Dio? dio = DioFactory.getInstance();

  static Future<List<Device>> getUserDevices(int idUser, int page) async {
    Response response = await dio!.get("/device/user/$idUser?page=$page");
    return (response.data as List).map((e) => Device.fromJson(e)).toList();
  }
}
