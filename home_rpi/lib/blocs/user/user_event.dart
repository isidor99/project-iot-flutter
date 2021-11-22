abstract class UserEvent {}

class UserLoggedIn extends UserEvent {
  String username;

  UserLoggedIn(this.username);
}

class UserOpenedApp extends UserEvent {}

class UserLoggedOut extends UserEvent {
  String username;

  UserLoggedOut(this.username);
}
