import 'package:home_rpi/models/measurement.dart';
import 'package:home_rpi/dao/measurement_dao.dart';
import 'package:home_rpi/services/api/measurement_api_provider.dart';

class MeasurementRepository {
  static Future<List<Measurement>> getMeasurements(
      int idMeasurementInfo, String? dDate, int page, int selectType) async {
    List<Measurement> measurements =
        await MeasurementDao.getMeasurementsForDevice(idMeasurementInfo, dDate, page, selectType);

    if (measurements.isEmpty) {
      if (selectType == MeasurementDao.selectAll) {
        measurements = await MeasurementApiProvider.getMeasurements(idMeasurementInfo, page);
      } else if (selectType == MeasurementDao.selectDate) {
        measurements =
            await MeasurementApiProvider.getMeasurementsByDate(idMeasurementInfo, dDate, page);
      } else if (selectType == MeasurementDao.selectMonth) {
        measurements = await MeasurementApiProvider.getMeasurementsByMonth(
            idMeasurementInfo, int.parse(dDate!), page);
      }

      MeasurementDao.addMeasurements(measurements);
    }

    return measurements;
  }
}
