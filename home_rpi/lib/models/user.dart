import 'package:intl/intl.dart';

class User {
  late bool success;
  late int idUser;
  late String name;
  late String surname;
  late String birthDate;
  late String profileImage;
  late String username;
  late String email;

  User.fromJson(Map<String, dynamic> json) {
    success = json['success'] == 1;
    idUser = json['idUser'] ?? 0;
    name = json['name'] ?? "";
    surname = json['surname'] ?? "";
    birthDate = json['birthDate'] ?? "";
    profileImage = json['profileImage'] ?? "";
    username = json['username'] ?? "";
    email = json['email'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['success'] = success ? 1 : 0;
    data['idUser'] = idUser;
    data['name'] = name;
    data['surname'] = surname;
    data['birthDate'] = birthDate;
    data['profileImage'] = profileImage;
    data['username'] = username;
    data['email'] = email;

    return data;
  }

  String getFullName() => '$surname, $name';

  String getFormattedDate() {
    final DateFormat formatter = DateFormat('dd.MM.yyyy.');
    final String dateString = formatter.format(DateTime.parse(birthDate));

    return dateString;
  }

  @override
  String toString() {
    return "$idUser: $surname, $name ($birthDate), Login = $success";
  }
}
