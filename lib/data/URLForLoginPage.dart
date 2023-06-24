// ignore: file_names
import 'dart:convert';

UserDataForLogin userDataForLoginFromJson(String str) =>
    UserDataForLogin.fromJson(json.decode(str));

String userDataForLoginToJson(UserDataForLogin data) =>
    json.encode(data.toJson());

class UserDataForLogin {
  int id;
  String username;
  bool success;

  UserDataForLogin({
    required this.id,
    required this.username,
    required this.success,
  });

  factory UserDataForLogin.fromJson(Map<String, dynamic> json) =>
      UserDataForLogin(
        id: json["id"],
        username: json["username"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "success": success,
      };
}
