// To parse this JSON data, do
//
//     final applyCouponModel = applyCouponModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ApplyCouponModel applyCouponModelFromJson(String str) =>
    ApplyCouponModel.fromJson(json.decode(str));

String applyCouponModelToJson(ApplyCouponModel data) =>
    json.encode(data.toJson());

class ApplyCouponModel {
  ApplyCouponModel({
    required this.user,
    required this.offerprice,
  });

  bool user;
  int? offerprice;

  factory ApplyCouponModel.fromJson(Map<String, dynamic> json) =>
      ApplyCouponModel(
        user: json["user"],
        offerprice: json["offerprice"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "offerprice": offerprice,
      };
}
