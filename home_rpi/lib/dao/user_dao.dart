import 'dart:async';

import 'package:home_rpi/models/user.dart';
import 'package:home_rpi/services/database_factory.dart';

class UserDao {
  static final dbProvider = DatabaseProvider.dbProvider;

  static Future<User?> getLoggedInUser() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result =
        await db!.query(TableNames.tUserName, where: "success = ?", whereArgs: [1]);

    return result.isNotEmpty ? User.fromJson(result[0]) : null;
  }

  static Future<void> addUser(User user) async {
    final db = await dbProvider.database;
    await db!.insert(TableNames.tUserName, user.toJson());
  }

  static Future<int> deleteUser(String username) async {
    final db = await dbProvider.database;
    int result =
        await db!.delete(TableNames.tUserName, where: 'username = ?', whereArgs: [username]);
    return result;
  }
}
