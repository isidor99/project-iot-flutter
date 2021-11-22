import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:home_rpi/blocs/measurement_info/measurement_info_bloc.dart';
import 'package:home_rpi/blocs/measurement_info/measurement_info_state.dart';
import 'package:home_rpi/models/measurement_info.dart';
import 'package:home_rpi/ui/widgets/grouped_list_header.dart';
import 'package:home_rpi/ui/widgets/items/measurement_info_item.dart';

class MeasurementsInfoScreen extends StatelessWidget {
  const MeasurementsInfoScreen({Key? key}) : super(key: key);

  static const routeName = "measurementsInfo";

  Widget _buildMeasurementsInfoList(BuildContext context, List<MeasurementInfo> info) {
    return GroupedListView(
        elements: info,
        groupBy: (i) => (i as MeasurementInfo).deviceName,
        itemBuilder: (context, element) => MeasurementInfoItem(element as MeasurementInfo),
        groupSeparatorBuilder: (String element) => GroupedListHeader(element));
  }

  Widget _buildLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Measurements"),
        ),
        body: BlocConsumer<MeasurementInfoBloc, MeasurementInfoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MeasurementInfoFetchSuccess) {
              return _buildMeasurementsInfoList(context, state.info);
            }

            return _buildLoading(context);
          },
        ));
  }
}
