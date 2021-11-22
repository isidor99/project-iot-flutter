import 'package:home_rpi/models/device.dart';

abstract class DeviceState {}

class DeviceInitial extends DeviceState {}

class DeviceFetchSuccess extends DeviceState {
  int page;
  List<Device> devices;

  DeviceFetchSuccess(this.page, this.devices);
}

class DeviceFetchFailure extends DeviceState {
  String message;

  DeviceFetchFailure(this.message);
}
