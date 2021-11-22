abstract class DeviceEvent {}

class DeviceFetch extends DeviceEvent {
  int idUser;
  int page;

  DeviceFetch(this.idUser, this.page);
}