// To parse this JSON data, do
//
//     final removeProductCartModel = removeProductCartModelFromJson(jsonString);

import 'dart:convert';

RemoveProductCartModel removeProductCartModelFromJson(String str) =>
    RemoveProductCartModel.fromJson(json.decode(str));

String removeProductCartModelToJson(RemoveProductCartModel data) =>
    json.encode(data.toJson());

class RemoveProductCartModel {
  RemoveProductCartModel({
    required this.response,
  });

  Response response;

  factory RemoveProductCartModel.fromJson(Map<String, dynamic> json) =>
      RemoveProductCartModel(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.acknowledged,
    required this.modifiedCount,
    required this.upsertedId,
    required this.upsertedCount,
    required this.matchedCount,
  });

  bool acknowledged;
  int modifiedCount;
  dynamic upsertedId;
  int upsertedCount;
  int matchedCount;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        acknowledged: json["acknowledged"],
        modifiedCount: json["modifiedCount"],
        upsertedId: json["upsertedId"],
        upsertedCount: json["upsertedCount"],
        matchedCount: json["matchedCount"],
      );

  Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "modifiedCount": modifiedCount,
        "upsertedId": upsertedId,
        "upsertedCount": upsertedCount,
        "matchedCount": matchedCount,
      };
}
