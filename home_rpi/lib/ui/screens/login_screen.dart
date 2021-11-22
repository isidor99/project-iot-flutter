import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/ui/screens/root_screen.dart';
import 'package:home_rpi/ui/widgets/button.dart';
import 'package:home_rpi/ui/widgets/text_input.dart';

import 'package:home_rpi/blocs/user/user_bloc.dart';
import 'package:home_rpi/blocs/user/user_state.dart';
import 'package:home_rpi/blocs/user/user_event.dart';
import 'package:home_rpi/blocs/device/device_bloc.dart';
import 'package:home_rpi/blocs/device/device_event.dart';
import 'package:home_rpi/blocs/measurement_info/measurement_info_bloc.dart';
import 'package:home_rpi/blocs/measurement_info/measurement_info_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  late final UserBloc _userBloc;

  void _onButtonPressed() {
    _userBloc.add(UserLoggedIn(_usernameController.text));
  }

  Widget _buildLogInPage(String? message) {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Padding(
        padding: const EdgeInsets.only(top: 86),
        child: Container(
            width: 128,
            height: 128,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/rpi.webp")),
              borderRadius: BorderRadius.all(Radius.circular(64.0)),
            )),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextInput("Username", _usernameController, color: Colors.white),
          ),
          message != null
              ? Text(
                  message,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                )
              : const SizedBox(
                  height: 8,
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: Button(
                  "Submit",
                  _onButtonPressed,
                  color: Colors.white,
                ),
              ),
            ]),
          )
        ],
      ),
    ]);
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator(color: Colors.white));
  }

  void _openRootScreen(context) {
    Navigator.pushReplacementNamed(context, RootScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of(context);
    if (_userBloc.state is UserInitial) {
      _userBloc.add(UserOpenedApp());
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.redAccent,
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLogInSuccess) {
              // load devices
              final deviceBloc = BlocProvider.of<DeviceBloc>(context);
              deviceBloc.add(DeviceFetch(state.user!.idUser, 1));

              // load measurement info
              final measurementInfoBloc = BlocProvider.of<MeasurementInfoBloc>(context);
              measurementInfoBloc.add(MeasurementInfoFetch(state.user!.idUser, 1));

              _openRootScreen(context);
            }
          },
          builder: (context, state) {
            if (state is UserInitial || state is UserLogOutSuccess) {
              return _buildLogInPage(null);
            } else if (state is UserLogInFailure) {
              return _buildLogInPage(state.message);
            } else if (state is UserLogInProgress || state is UserLogInSuccess) {
              return _buildLoading();
            }

            return _buildLogInPage("Something went wrong");
          },
        ));
  }
}
