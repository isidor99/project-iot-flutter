import 'package:flutter/material.dart';

import 'package:home_rpi/ui/screens.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  static const routeName = "root";

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  static const _widgetOptions = <Widget>[
    HomeScreen(),
    DevicesScreen(),
    MeasurementsInfoScreen(),
    ProfileScreen()
  ];

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'Devices'),
      const BottomNavigationBarItem(icon: Icon(Icons.query_stats), label: 'Stats'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(_appBarTitle[_selectedIndex])),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _getBottomNavigationBarItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        onTap: _onItemTapped,
      ),
    );
  }
}
