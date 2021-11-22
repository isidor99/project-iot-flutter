import 'package:home_rpi/models/device.dart';
import 'package:home_rpi/dao/device_dao.dart';
import 'package:home_rpi/services/api/device_api_provider.dart';

class DeviceRepository {
  static Future<List<Device>> getDevices(int idUser, int page) async {
    List<Device> devices = await DeviceDao.getDevices(page);

    if (devices.isEmpty) {
      devices = await DeviceApiProvider.getUserDevices(idUser, page);
      if (devices.isNotEmpty) {
        await DeviceDao.addDevices(devices);
      }
    }

    return devices;
  }
}
