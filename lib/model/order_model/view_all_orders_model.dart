// To parse this JSON data, do
//
//     final getAllOrdersModel = getAllOrdersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAllOrdersModel getAllOrdersModelFromJson(String str) => GetAllOrdersModel.fromJson(json.decode(str));

String getAllOrdersModelToJson(GetAllOrdersModel data) => json.encode(data.toJson());

class GetAllOrdersModel {
    GetAllOrdersModel({
        required this.orders,
    });

    List<Order> orders;

    factory GetAllOrdersModel.fromJson(Map<String, dynamic> json) => GetAllOrdersModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    };
}

class Order {
    Order({
        required this.id,
        required this.deliveryDetails,
        required this.userId,
        required this.user,
        required this.paymentMethode,
        required this.products,
        required this.totalAmount,
        required this.status,
        required this.payment,
        required this.date,
        required this.orderDate,
    });

    String id;
    DeliveryDetails deliveryDetails;
    String userId;
    String user;
    String paymentMethode;
    List<Product> products;
    int totalAmount;
    String status;
    String payment;
    DateTime date;
    String orderDate;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        deliveryDetails: DeliveryDetails.fromJson(json["deliveryDetails"]),
        userId: json["userId"],
        user: json["user"],
        paymentMethode: json["paymentMethode"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        totalAmount: json["totalAmount"],
        status: json["status"],
        payment: json["payment"],
        date: DateTime.parse(json["Date"]),
        orderDate: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "deliveryDetails": deliveryDetails.toJson(),
        "userId": userId,
        "user": user,
        "paymentMethode": paymentMethode,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "status": status,
        "payment": payment,
        "Date": date.toIso8601String(),
        "date": orderDate,
    };
}

class DeliveryDetails {
    DeliveryDetails({
        required this.mobile,
        required this.address,
        required this.pincode,
        required this.state,
        required this.city,
        required this.houseNo,
    });

    String mobile;
    String address;
    String pincode;
    String state;
    String city;
    int houseNo;

    factory DeliveryDetails.fromJson(Map<String, dynamic> json) => DeliveryDetails(
        mobile: json["mobile"],
        address: json["address"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        houseNo: json["houseNO"],
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "address": address,
        "pincode": pincode,
        "state": state,
        "city": city,
        "houseNO": houseNo,
    };
}

class Product {
    Product({
        required this.item,
        required this.quantity,
    });

    String item;
    int quantity;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        item: json["item"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "item": item,
        "quantity": quantity,
    };
}
