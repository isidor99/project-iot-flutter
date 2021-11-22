import 'package:dio/dio.dart';

import 'package:home_rpi/models/user.dart';
import 'package:home_rpi/services/dio_factory.dart';

class UserApiProvider {
  static Future<User> getUser(String username) async {
    Dio? dio = DioFactory.getInstance();
    Response response = await dio!.get("/user/login/$username");

    return User.fromJson(response.data);
  }
}
