import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
