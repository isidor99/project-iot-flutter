import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/blocs/device/device_bloc.dart';
import 'package:home_rpi/blocs/device/device_state.dart';
import 'package:home_rpi/models/device.dart';
import 'package:home_rpi/ui/screens/device/add_device_screen.dart';
import 'package:home_rpi/ui/widgets/items/device_item.dart';
import 'package:home_rpi/ui/widgets/list_item_divider.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  static const routeName = "devices";

  void _fabPressed(BuildContext context) {
    Navigator.pushNamed(context, AddDeviceScreen.routeName);
  }

  Widget _buildLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
  }

  Widget _buildList(List<Device> devices) {
    return ListView.separated(
      itemBuilder: (context, index) => DeviceItem(devices[index]),
      itemCount: devices.length,
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ListItemDivider(),
      ),
    );
  }

  Widget _buildDevicesList(List<Device> devices, BuildContext context) {
    return Stack(
      children: [
        Container(
          child: _buildList(devices),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
          child: Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                onPressed: () => _fabPressed(context),
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.add)),
          ),
        )
      ],
    );
  }

  Widget _buildDevicesError(String message) {
    return Center(child: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devices"),
      ),
      body: BlocConsumer<DeviceBloc, DeviceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DeviceFetchSuccess) {
            return _buildDevicesList(state.devices, context);
          } else if (state is DeviceFetchFailure) {
            return _buildDevicesError(state.message);
          }
          return _buildLoading(context);
        },
      ),
    );
  }
}
