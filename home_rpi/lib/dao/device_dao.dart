import 'dart:async';

import 'package:home_rpi/models/device.dart';
import 'package:home_rpi/services/database_factory.dart';
import 'package:sqflite/sqflite.dart';

class DeviceDao {
  static const perPage = 15;

  static final dbProvider = DatabaseProvider.dbProvider;

  static Future<void> addDevices(List<Device> devices) async {
    final db = await dbProvider.database;

    Batch batch = db!.batch();
    for (var d in devices) {
      batch.insert(TableNames.tDeviceName, d.toJson());
    }

    await batch.commit(noResult: true);
  }

  static Future<List<Device>> getDevices(
    int page,
  ) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result =
        await db!.query(TableNames.tDeviceName, offset: (page - 1) * perPage, limit: perPage);

    List<Device> devices = result.isNotEmpty ? result.map((e) => Device.fromJson(e)).toList() : [];

    return devices;
  }
}
