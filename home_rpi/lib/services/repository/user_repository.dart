import 'package:home_rpi/models/user.dart';
import 'package:home_rpi/dao/user_dao.dart';
import 'package:home_rpi/services/api/user_api_provider.dart';

class UserRepository {
  static Future<User?> getLoggedInUser() async {
    User? loggedInUser = await UserDao.getLoggedInUser();
    return loggedInUser;
  }

  static Future<int> logout(String username) async {
    int result = await UserDao.deleteUser(username);
    return result;
  }

  static Future<User> logIn(String username) async {
    User user = await UserApiProvider.getUser(username);

    if (user.success) {
      await UserDao.addUser(user);
    }

    return user;
  }
}
