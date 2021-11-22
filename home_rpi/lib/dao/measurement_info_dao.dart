import 'dart:async';

import 'package:home_rpi/models/measurement_info.dart';
import 'package:home_rpi/services/database_factory.dart';
import 'package:sqflite/sqflite.dart';

class MeasurementInfoDao {
  static const perPage = 15;

  static final dbProvider = DatabaseProvider.dbProvider;

  static Future<void> addMeasurementsInfo(List<MeasurementInfo> measurementsInfo) async {
    final db = await dbProvider.database;

    Batch batch = db!.batch();
    for (var i in measurementsInfo) {
      batch.insert(TableNames.tMeasurementInfo, i.toJson());
    }

    await batch.commit(noResult: true);
  }

  static Future<List<MeasurementInfo>> getMeasurementsInfo(int idUser, int page) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result = await db!.query(TableNames.tMeasurementInfo,
        where: "idUser = ?", whereArgs: [idUser], offset: (page - 1) * perPage, limit: perPage);

    List<MeasurementInfo> measurementsInfo =
        result.isNotEmpty ? result.map((e) => MeasurementInfo.fromJson(e)).toList() : [];

    return measurementsInfo;
  }
}
