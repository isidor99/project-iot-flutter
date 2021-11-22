import 'package:flutter/material.dart';

import 'package:home_rpi/ui/screens.dart';

class HomeRpiRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RootScreen.routeName:
        return MaterialPageRoute(builder: (_) => RootScreen());
      case DevicesScreen.routeName:
        return MaterialPageRoute(builder: (_) => DevicesScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case MeasurementsScreen.routeName:
        int idMeasurementInfo = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MeasurementsScreen(idMeasurementInfo));
      case MeasurementsInfoScreen.routeName:
        return MaterialPageRoute(builder: (_) => MeasurementsInfoScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AddDeviceScreen.routeName:
        return MaterialPageRoute(builder: (_) => AddDeviceScreen());
      case DeviceInfoScreen.routeName:
        return MaterialPageRoute(builder: (_) => DeviceInfoScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
