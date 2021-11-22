import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/blocs/measurement_info/measurement_info_state.dart';
import 'package:home_rpi/blocs/measurement_info/measurement_info_event.dart';
import 'package:home_rpi/services/repository/measurement_info_repository.dart';
import 'package:home_rpi/models/measurement_info.dart';

class MeasurementInfoBloc extends Bloc<MeasurementInfoEvent, MeasurementInfoState> {
  MeasurementInfoBloc() : super(MeasurementInfoInitial());

  @override
  Stream<MeasurementInfoState> mapEventToState(MeasurementInfoEvent event) async* {
    if (event is MeasurementInfoFetch) {
      List<MeasurementInfo> info =
          await MeasurementInfoRepository.getMeasurementsInfo(event.idUser, event.page);
      yield MeasurementInfoFetchSuccess(event.page, info);
    }
  }
}
