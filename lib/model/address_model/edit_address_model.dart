// To parse this JSON data, do
//
//     final editAddressModel = editAddressModelFromJson(jsonString);

import 'dart:convert';

EditAddressModel editAddressModelFromJson(String str) => EditAddressModel.fromJson(json.decode(str));

String editAddressModelToJson(EditAddressModel data) => json.encode(data.toJson());

class EditAddressModel {
    EditAddressModel({
        required this.resp,
    });

    Resp resp;

    factory EditAddressModel.fromJson(Map<String, dynamic> json) => EditAddressModel(
        resp: Resp.fromJson(json["resp"]),
    );

    Map<String, dynamic> toJson() => {
        "resp": resp.toJson(),
    };
}

class Resp {
    Resp({
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

    factory Resp.fromJson(Map<String, dynamic> json) => Resp(
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
