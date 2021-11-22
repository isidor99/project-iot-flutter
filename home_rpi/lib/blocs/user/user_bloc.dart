import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_rpi/models/user.dart';
import 'package:home_rpi/blocs/user/user_state.dart';
import 'package:home_rpi/blocs/user/user_event.dart';
import 'package:home_rpi/services/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoggedIn) {
      if (event.username.isEmpty) {
        yield UserLogInFailure("Username must not be empty");
      } else {
        try {
          yield UserLogInProgress();

          final User user = await UserRepository.logIn(event.username);
          if (user.success) {
            yield UserLogInSuccess(user);
          } else {
            yield UserLogInFailure("Wrong username");
          }
        } on Exception {
          yield UserLogInFailure("Error while trying to log in");
        }
      }
    } else if (event is UserOpenedApp) {
      try {
        yield UserLogInProgress();

        final User? user = await UserRepository.getLoggedInUser();
        if (user == null) {
          yield UserInitial();
        } else {
          yield UserLogInSuccess(user);
        }
      } on Exception {
        yield UserLogInFailure("Error while trying to log in");
      }
    } else if (event is UserLoggedOut) {
      int result = await UserRepository.logout(event.username);
      if (result > 0) {
        yield UserLogOutSuccess();
      }
    }
  }
}
