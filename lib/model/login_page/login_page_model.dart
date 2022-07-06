// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.response,
  });

  Response response;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.user,
    required this.status,
  });

  User user;
  bool status;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        user: User.fromJson(json["user"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "status": status,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  String id;
  String name;
  String email;
  String password;
  String phoneNumber;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
