import 'package:flutter/material.dart';
import 'package:home_rpi/blocs/measurement/measurement_event.dart';
import 'package:home_rpi/services/api/measurement_api_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/models/measurement.dart';
import 'package:home_rpi/blocs/measurement/measurement_bloc.dart';
import 'package:home_rpi/blocs/measurement/measurement_state.dart';
import 'package:home_rpi/ui/widgets/list_item_divider.dart';
import 'package:home_rpi/ui/widgets/items/measurement_item.dart';

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen(this.idMeasurementInfo, {Key? key}) : super(key: key);

  final int idMeasurementInfo;

  static const routeName = "measurements";

  @override
  _MeasurementsScreenState createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  late ScrollController _scrollController;
  bool _loading = false;
  DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd.MM.yyyy.');
  late final MeasurementBloc _measurementBloc;

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 16) {
      setState(() {
        _loading = true;
      });
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (cxt, child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (picked != null && picked != now) {
      setState(() {
        now = picked;
      });

      String dateApi = MeasurementApiProvider.apiDateFormat.format(picked);
      _measurementBloc.add(MeasurementFetchByDate(widget.idMeasurementInfo, dateApi, 1));
    }
  }

  Widget _buildList(List<Measurement> measurements) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) => MeasurementItem(measurements[index]),
      itemCount: measurements.length,
    );
  }

  Widget _buildMeasurementsScreen(BuildContext context, List<Measurement> measurements) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(formatter.format(now),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                  onTap: () => _selectDate(context),
                  child: Text('Select date...',
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14))),
            )
          ],
        ),
        const ListItemDivider(),
        Expanded(child: _buildList(measurements))
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _measurementBloc = BlocProvider.of<MeasurementBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Measurements')),
        body: BlocConsumer<MeasurementBloc, MeasurementState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MeasurementFetchSuccess) {
              return _buildMeasurementsScreen(context, state.measurements);
            } else if (state is MeasurementLoadingInitial) {
              return _buildLoading(context);
            }

            return _buildLoading(context);
          },
        ));
  }
}
