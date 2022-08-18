
import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
    AddAddressModel({
        required this.response,
    });

    Response response;

    factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
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
