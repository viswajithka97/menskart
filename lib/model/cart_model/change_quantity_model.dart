// To parse this JSON data, do
//
//     final changeQuantityModel = changeQuantityModelFromJson(jsonString);

import 'dart:convert';

ChangeQuantityModel changeQuantityModelFromJson(String str) => ChangeQuantityModel.fromJson(json.decode(str));

String changeQuantityModelToJson(ChangeQuantityModel data) => json.encode(data.toJson());

class ChangeQuantityModel {
    ChangeQuantityModel({
        required this.response,
    });

    Response response;

    factory ChangeQuantityModel.fromJson(Map<String, dynamic> json) => ChangeQuantityModel(
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
    };
}

class Response {
    Response({
        required this.status,
        required this.total,
    });

    bool status;
    dynamic total;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total": total,
    };
}
