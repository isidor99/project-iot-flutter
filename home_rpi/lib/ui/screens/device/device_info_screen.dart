import 'package:flutter/material.dart';

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({Key? key}) : super(key: key);

  static const routeName = "deviceInfo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Device Info"),),
      body: Center(child: Text('Device info'))
    );
  }
}
