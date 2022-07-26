// To parse this JSON data, do
//
//     final orderCancelModel = orderCancelModelFromJson(jsonString);

import 'dart:convert';

OrderCancelModel orderCancelModelFromJson(String str) =>
    OrderCancelModel.fromJson(json.decode(str));

String orderCancelModelToJson(OrderCancelModel data) =>
    json.encode(data.toJson());

class OrderCancelModel {
  OrderCancelModel({
    required this.status,
  });

  bool status;

  factory OrderCancelModel.fromJson(Map<String, dynamic> json) =>
      OrderCancelModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
