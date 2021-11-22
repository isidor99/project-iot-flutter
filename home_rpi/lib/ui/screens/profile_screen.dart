import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_rpi/blocs/user/user_bloc.dart';
import 'package:home_rpi/blocs/user/user_event.dart';
import 'package:home_rpi/blocs/user/user_state.dart';

import 'package:home_rpi/models/user.dart';
import 'package:home_rpi/ui/screens/login_screen.dart';
import 'package:home_rpi/ui/widgets/profile/profile_body.dart';
import 'package:home_rpi/ui/widgets/profile/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = "profile";

  void _onLogoutPressed(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(UserLoggedOut((userBloc.state as UserLogInSuccess).user!.username));
  }

  Widget _buildProfile(User? user) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ProfileHeader(user), ProfileBody(user)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _onLogoutPressed(context),
            )
          ],
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLogOutSuccess) {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            }
          },
          builder: (context, state) {
            if (state is UserLogInSuccess) {
              return _buildProfile(state.user);
            }
            return Container();
          },
        ));
  }
}
