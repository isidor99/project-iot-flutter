import 'package:home_rpi/models/measurement_info.dart';
import 'package:home_rpi/dao/measurement_info_dao.dart';
import 'package:home_rpi/services/api/measurement_info_api_provider.dart';

class MeasurementInfoRepository {
  static Future<List<MeasurementInfo>> getMeasurementsInfo(int idUser, int page) async {
    List<MeasurementInfo> measurementsInfo =
        await MeasurementInfoDao.getMeasurementsInfo(idUser, page);

    if (measurementsInfo.isEmpty) {
      measurementsInfo = await MeasurementInfoApiProvider.getMeasurementsInfo(idUser, page);
      if (measurementsInfo.isNotEmpty) {
        await MeasurementInfoDao.addMeasurementsInfo(measurementsInfo);
      }
    }

    return measurementsInfo;
  }
}
