import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String userName;
  String password;
  User({this.userName, this.password});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(userName: json["username"], password: json["password"]);
  Map<String, dynamic> toJson() => {"username": userName, "password": password};
}
