import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/blocs/device/device_event.dart';
import 'package:home_rpi/blocs/device/device_state.dart';
import 'package:home_rpi/services/repository/device_repository.dart';
import 'package:home_rpi/models/device.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceInitial());

  @override
  Stream<DeviceState> mapEventToState(DeviceEvent event) async* {
    if (event is DeviceFetch) {
      try {
        List<Device> devices = await DeviceRepository.getDevices(event.idUser, event.page);
        yield DeviceFetchSuccess(event.page + 1, devices);
      } on Exception {
        yield DeviceFetchFailure("Can't load devices");
      }
    }
  }
}