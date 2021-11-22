import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/blocs/user/user_bloc.dart';
import 'package:home_rpi/blocs/device/device_bloc.dart';
import 'package:home_rpi/blocs/measurement_info/measurement_info_bloc.dart';
import 'package:home_rpi/blocs/measurement/measurement_bloc.dart';
import 'package:home_rpi/ui/screens/login_screen.dart';
import 'package:home_rpi/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(),
        ),
        BlocProvider<DeviceBloc>(
          create: (_) => DeviceBloc(),
        ),
        BlocProvider<MeasurementInfoBloc>(
          create: (_) => MeasurementInfoBloc(),
        ),
        BlocProvider<MeasurementBloc>(
          create: (_) => MeasurementBloc(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.redAccent,
            primaryColorLight: Colors.redAccent[100],
            appBarTheme: const AppBarTheme(color: Colors.redAccent)),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: HomeRpiRouter.generateRoutes,
      ),
    );
  }
}
