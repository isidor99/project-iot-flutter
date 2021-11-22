abstract class MeasurementInfoEvent {}

class MeasurementInfoFetch extends MeasurementInfoEvent {
  int idUser;
  int page;

  MeasurementInfoFetch(this.idUser, this.page);
}
