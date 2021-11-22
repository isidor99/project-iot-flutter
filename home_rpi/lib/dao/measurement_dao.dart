import 'dart:async';

import 'package:home_rpi/models/measurement.dart';
import 'package:home_rpi/services/database_factory.dart';
import 'package:sqflite/sqflite.dart';

class MeasurementDao {
  static const selectAll = 0;
  static const selectMonth = 1;
  static const selectDate = 2;

  static const perPage = 30;

  static final dbProvider = DatabaseProvider.dbProvider;

  static Future<void> addMeasurements(List<Measurement> measurements) async {
    final db = await dbProvider.database;

    Batch batch = db!.batch();
    for (var m in measurements) {
      batch.insert(TableNames.tMeasurementName, m.toJson());
    }

    await batch.commit(noResult: true);
  }

  static Future<List<Measurement>> getMeasurementsForDevice(
      int idMeasurementInfo, String? dDate, int page, int selectType) async {
    final db = await dbProvider.database;

    late List<Map<String, dynamic>> result = [];
    if (selectType == selectAll) {
      result = await db!.query(TableNames.tMeasurementName,
          where: "idMeasurementInfo = ?",
          whereArgs: [idMeasurementInfo],
          orderBy: "mDatetime DESC",
          offset: (page - 1) * perPage,
          limit: perPage);
    } else if (selectType == selectMonth) {
      result = await db!.query(TableNames.tMeasurementName,
          where:
              "idMeasurementInfo = ? and strftime('%m', ${TableNames.tMeasurementName}.mDatetime) = ?",
          whereArgs: [idMeasurementInfo, dDate],
          orderBy: "mDatetime DESC",
          offset: (page - 1) * perPage,
          limit: perPage);
    } else if (selectType == selectDate) {
      result = await db!.query(TableNames.tMeasurementName,
          where:
              "idMeasurementInfo = ? and strftime('%Y-%m-%d', ${TableNames.tMeasurementName}.mDatetime) = ?",
          whereArgs: [idMeasurementInfo, dDate],
          orderBy: "mDatetime DESC",
          offset: (page - 1) * perPage,
          limit: perPage);
    }

    List<Measurement> measurements =
        result.isNotEmpty ? result.map((e) => Measurement.fromJson(e)).toList() : [];

    return measurements;
  }
}
