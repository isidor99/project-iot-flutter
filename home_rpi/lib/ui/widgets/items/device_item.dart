import 'package:flutter/material.dart';

import 'package:home_rpi/models/device.dart';
import 'package:home_rpi/ui/screens/device/device_info_screen.dart';

class DeviceItem extends StatelessWidget {
  const DeviceItem(this.device, {Key? key}) : super(key: key);

  final Device device;

  void _onDeviceItemTapped(BuildContext context) {
    Navigator.pushNamed(context, DeviceInfoScreen.routeName);
  }

  TextStyle _nameTextStyle() {
    return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
            onTap: () => _onDeviceItemTapped(context),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(device.deviceName, style: _nameTextStyle()),
                  device.description.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(device.shortDescription),
                        )
                      : const SizedBox(
                          height: 0,
                        )
                ])));
  }
}
