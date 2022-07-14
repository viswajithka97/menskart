// To parse this JSON data, do
//
//     final wishlishtViewModel = wishlishtViewModelFromJson(jsonString);

import 'dart:convert';

WishlishtViewModel wishlishtViewModelFromJson(String str) => WishlishtViewModel.fromJson(json.decode(str));

String wishlishtViewModelToJson(WishlishtViewModel data) => json.encode(data.toJson());

class WishlishtViewModel {
    WishlishtViewModel({
        required this.wishilistItems,
        required this.userId,
        required this.cartCount,
        required this.wishilistCount,
    });

    List<WishilistItem> wishilistItems;
    String userId;
    int? cartCount;
    int? wishilistCount;

    factory WishlishtViewModel.fromJson(Map<String, dynamic> json) => WishlishtViewModel(
        wishilistItems: List<WishilistItem>.from(json["wishilistItems"].map((x) => WishilistItem.fromJson(x))),
        userId: json["userId"],
        cartCount: json["cartCount"],
        wishilistCount: json["wishilistCount"],
    );

    Map<String, dynamic> toJson() => {
        "wishilistItems": List<dynamic>.from(wishilistItems.map((x) => x.toJson())),
        "userId": userId,
        "cartCount": cartCount,
        "wishilistCount": wishilistCount,
    };
}

class WishilistItem {
    WishilistItem({
        required this.id,
        required this.item,
        required this.product,
    });

    String id;
    String item;
    Product product;

    factory WishilistItem.fromJson(Map<String, dynamic> json) => WishilistItem(
        id: json["_id"],
        item: json["item"],
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "product": product.toJson(),
    };
}

class Product {
    Product({
        required this.id,
        required this.category,
        required this.brand,
        required this.description,
        required this.orginalPrice,
        required this.offerpercentage,
        required this.offerPrice,
    });

    String id;
    String category;
    String brand;
    String description;
    String orginalPrice;
    String offerpercentage;
    int offerPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
