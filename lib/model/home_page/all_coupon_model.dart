
import 'dart:convert';

AllCouponModle allCouponModleFromJson(String str) => AllCouponModle.fromJson(json.decode(str));

String allCouponModleToJson(AllCouponModle data) => json.encode(data.toJson());

class AllCouponModle {
    AllCouponModle({
        required this.admin,
        required this.coupon,
    });

    bool admin;
    List<Coupon> coupon;

    factory AllCouponModle.fromJson(Map<String, dynamic> json) => AllCouponModle(
        admin: json["admin"],
        coupon: List<Coupon>.from(json["coupon"].map((x) => Coupon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "admin": admin,
        "coupon": List<dynamic>.from(coupon.map((x) => x.toJson())),
    };
}

class Coupon {
    Coupon({
        required this.id,
        required this.coupon,
        required this.discount,
        required this.startDate,
        required this.expiryDate,
        required this.user,
    });

    String id;
    String coupon;
    String discount;
    DateTime startDate;
    DateTime expiryDate;
    List<User> user;

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["_id"],
        coupon: json["coupon"],
        discount: json["discount"],
        startDate: DateTime.parse(json["startDate"]),
        expiryDate: DateTime.parse(json["expiryDate"]),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "coupon": coupon,
        "discount": discount,
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "expiryDate": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class User {
    User({
        required this.userId,
    });

    String userId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
    };
}
