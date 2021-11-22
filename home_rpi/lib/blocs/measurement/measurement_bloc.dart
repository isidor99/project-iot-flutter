import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/services/repository/measurement_repository.dart';
import 'package:home_rpi/blocs/measurement/measurement_event.dart';
import 'package:home_rpi/blocs/measurement/measurement_state.dart';
import 'package:home_rpi/models/measurement.dart';
import 'package:home_rpi/dao/measurement_dao.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  MeasurementBloc() : super(MeasurementInitial());

  @override
  Stream<MeasurementState> mapEventToState(MeasurementEvent event) async* {
    if (event is MeasurementFetch) {
      yield MeasurementInitial();

      List<Measurement> measurements = await MeasurementRepository.getMeasurements(
          event.idMeasurementInfo, null, event.page, MeasurementDao.selectAll);

      yield MeasurementFetchSuccess(measurements, null, event.page + 1);
    } else if (event is MeasurementFetchByDate) {

      if (event.page == 1) {
        yield MeasurementLoadingInitial();
      } else {
        yield MeasurementLoadingMore();
      }

      List<Measurement> measurements = await MeasurementRepository.getMeasurements(
          event.idMeasurementInfo, event.dDate, event.page, MeasurementDao.selectDate);

      yield MeasurementFetchSuccess(measurements, event.dDate, event.page + 1);
    } else if (event is MeasurementFetchByMonth) {
      yield MeasurementInitial();

      List<Measurement> measurements = await MeasurementRepository.getMeasurements(
          event.idMeasurementInfo, event.dDate, event.page, MeasurementDao.selectMonth);

      yield MeasurementFetchSuccess(measurements, null, event.page + 1);
    }
  }
}
