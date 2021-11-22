import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/services/api/measurement_api_provider.dart';
import 'package:home_rpi/models/measurement_info.dart';
import 'package:home_rpi/blocs/measurement/measurement_bloc.dart';
import 'package:home_rpi/blocs/measurement/measurement_event.dart';
import 'package:home_rpi/ui/screens/measurement/measurements_screen.dart';

class MeasurementInfoItem extends StatelessWidget {
  const MeasurementInfoItem(this.measurementInfo, {Key? key}) : super(key: key);

  final MeasurementInfo measurementInfo;

  void _onMeasurementInfoTapped(BuildContext context) {
    final measurementBloc = BlocProvider.of<MeasurementBloc>(context);
    final DateTime now = DateTime.now();
    final String apiDate = MeasurementApiProvider.apiDateFormat.format(now);

    measurementBloc.add(MeasurementFetchByDate(measurementInfo.idMeasurementInfo, apiDate, 1));

    Navigator.pushNamed(context, MeasurementsScreen.routeName,
        arguments: measurementInfo.idMeasurementInfo);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onMeasurementInfoTapped(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
        child: Text(measurementInfo.physicalQuantityName, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
