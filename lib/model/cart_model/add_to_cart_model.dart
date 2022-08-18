
import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) => AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
    AddToCartModel({
        required this.status,
    });

    bool status;

    factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
