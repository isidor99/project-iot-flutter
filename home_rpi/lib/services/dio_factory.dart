import 'package:dio/dio.dart';

class DioFactory {
  static Dio? _dioInstance;

  static Dio? getInstance() {
    if (_dioInstance == null) {

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };

      _dioInstance = Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        baseUrl: "http://192.168.1.180:11450/",
        headers: headers
      ));
    }

    return _dioInstance;
  }
}