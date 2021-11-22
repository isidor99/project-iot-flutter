import 'package:home_rpi/models/measurement.dart';

abstract class MeasurementState {}

class MeasurementInitial extends MeasurementState {}

class MeasurementLoadingInitial extends MeasurementState {}

class MeasurementLoadingMore extends MeasurementState {}

class MeasurementFetchSuccess extends MeasurementState {
  int page;
  String? datetime;
  List<Measurement> measurements;

  MeasurementFetchSuccess(this.measurements, this.datetime, this.page);
}

class MeasurementFetchFailure extends MeasurementState {
  String message;

  MeasurementFetchFailure(this.message);
}
