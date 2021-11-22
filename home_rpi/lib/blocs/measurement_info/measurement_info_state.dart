import 'package:home_rpi/models/measurement_info.dart';

abstract class MeasurementInfoState {}

class MeasurementInfoInitial extends MeasurementInfoState {}

class MeasurementInfoFetchSuccess extends MeasurementInfoState {
  int page;
  List<MeasurementInfo> info;

  MeasurementInfoFetchSuccess(this.page, this.info);
}

class MeasurementInfoFetchFailure extends MeasurementInfoState {
  String message;

  MeasurementInfoFetchFailure(this.message);
}
