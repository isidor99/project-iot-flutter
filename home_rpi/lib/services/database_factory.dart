import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TableNames {
  static const tMeasurementName = "tMeasurement";
  static const tUserName = "tUser";
  static const tDeviceName = "tDevice";
  static const tMeasurementInfo = "tMeasurementInfo";
}

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  static const _dbName = "proj_iot.db";
  static const _dbVersion = 1;

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _createDatabase();
    return _database;
  }

  _createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(documentsDirectory.path, _dbName);

    var database = await openDatabase(dbPath, version: _dbVersion, onCreate: _onCreate);

    return database;
  }

  void _onCreate(Database database, int version) async {
    const tMeasurementQuery = "CREATE TABLE ${TableNames.tMeasurementName} ("
        "idMeasurement INT PRIMARY_KEY, "
        "idMeasurementUnit INT, "
        "idMeasurementType INT, "
        "idMeasurementInfo INT, "
        "idDevice INT, "
        "mDatetime DATETIME, "
        "value DOUBLE, "
        "unitName VARCHAR(45), "
        "unitSymbol VARCHAR(16), "
        "physicalQuantity VARCHAR(45)"
        ")";

    const tUserQuery = "CREATE TABLE ${TableNames.tUserName} ("
        "idUser INT PRIMARY_KEY, "
        "name VARCHAR(45), "
        "surname VARCHAR(45), "
        "birthDate DATE, "
        "profileImage VARCHAR(200), "
        "username VARCHAR(45), "
        "email VARCHAR(50), "
        "success TINYINT"
        ")";

    const tDeviceQuery = "CREATE TABLE ${TableNames.tDeviceName} ("
        "idDevice INTEGER PRIMARY_KEY, "
        "deviceName VARCHAR(45), "
        "shortDescription TEXT, "
        "description TEXT, "
        "idUser INT"
        ")";

    const tMeasurementInfoQuery = "CREATE TABLE ${TableNames.tMeasurementInfo} ("
        "idMeasurementInfo INTEGER PRIMARY_KEY, "
        "idDevice INTEGER, "
        "idMeasurementType INTEGER, "
        "idMeasurementUnit INTEGER, "
        "idUser INTEGER, "
        "deviceName VARCHAR(45), "
        "physicalQuantityName VARCHAR(45), "
        "description TEXT"
        ")";

    Batch batch = database.batch();
    batch.execute(tMeasurementQuery);
    batch.execute(tUserQuery);
    batch.execute(tDeviceQuery);
    batch.execute(tMeasurementInfoQuery);

    await batch.commit(noResult: true);
  }
}
