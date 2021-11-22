import 'package:flutter/material.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  static const routeName = "addDevice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Device"),),
      body: Center(child: Text("New"))
    );
  }
}
