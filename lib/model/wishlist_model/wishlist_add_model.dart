// To parse this JSON data, do
//
//     final wishlistAddModel = wishlistAddModelFromJson(jsonString);


import 'dart:convert';

WishlistAddModel wishlistAddModelFromJson(String str) => WishlistAddModel.fromJson(json.decode(str));

String wishlistAddModelToJson(WishlistAddModel data) => json.encode(data.toJson());

class WishlistAddModel {
    WishlistAddModel({
        required this.status,
    });

    bool status;

    factory WishlistAddModel.fromJson(Map<String, dynamic> json) => WishlistAddModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
