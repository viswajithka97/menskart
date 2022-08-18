// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    required this.products,
  });

  List<ProductElement> products;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  ProductElement({
    required this.id,
    required this.item,
    required this.quantity,
    required this.product,
  });

  String? id;
  String? item;
  int? quantity;
  ProductProduct? product;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["_id"],
        item: json["item"],
        quantity: json["quantity"],
        product: ProductProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "quantity": quantity,
        "product": product!.toJson(),
      };
}

class ProductProduct {
  ProductProduct({
    required this.id,
    required this.category,
    required this.brand,
    required this.description,
    required this.orginalPrice,
    required this.offerpercentage,
    required this.offerPrice,
  });

  String? id;
  String? category;
  String? brand;
  String? description;
  String? orginalPrice;
  String? offerpercentage;
  int? offerPrice;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        category: json["category"],
        brand: json["brand"],
        description: json["description"],
        orginalPrice: json["orginalPrice"],
        offerpercentage: json["offerpercentage"],
        offerPrice: json["offerPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "brand": brand,
        "description": description,
        "orginalPrice": orginalPrice,
        "offerpercentage": offerpercentage,
        "offerPrice": offerPrice,
      };
}
