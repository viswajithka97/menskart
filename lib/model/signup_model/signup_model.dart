// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);


import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
       required this.response,
    });

    Response response;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
    };
}

class Response {
    Response({
       required this.acknowledged,
       required this.insertedId,
    });

    bool acknowledged;
    String insertedId;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        acknowledged: json["acknowledged"],
        insertedId: json["insertedId"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "insertedId": insertedId,
    };
}
