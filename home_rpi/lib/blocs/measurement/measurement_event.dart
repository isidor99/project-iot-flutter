abstract class MeasurementEvent {}

class MeasurementFetch extends MeasurementEvent {
  int idMeasurementInfo;
  int page;

  MeasurementFetch(this.idMeasurementInfo, this.page);
}

class MeasurementFetchByDate extends MeasurementEvent {
  int idMeasurementInfo;
  String dDate;
  int page;

  MeasurementFetchByDate(this.idMeasurementInfo, this.dDate, this.page);
}

class MeasurementFetchByMonth extends MeasurementEvent {
  int idMeasurementInfo;
  String dDate;
  int page;

  MeasurementFetchByMonth(this.idMeasurementInfo, this.dDate, this.page);
}
