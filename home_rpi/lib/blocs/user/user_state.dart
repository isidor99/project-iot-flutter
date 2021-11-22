import 'package:home_rpi/models/user.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLogInSuccess extends UserState {
  User? user;

  UserLogInSuccess(this.user);
}

class UserLogInProgress extends UserState {}

class UserLogInFailure extends UserState {
  String message;

  UserLogInFailure(this.message);
}

class UserLogOutSuccess extends UserState {}
