// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    required this.products,
    required this.banner,
    required this.category,
    required this.trendingProducts,
    required this.cartCount,
    required this.wishilistCount,
  });

  List<Product> products;
  List<Banner> banner;
  List<Category> category;
  List<TrendingProduct> trendingProducts;
  dynamic cartCount;
  dynamic wishilistCount;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        trendingProducts: List<TrendingProduct>.from(
            json["trendingProducts"].map((x) => TrendingProduct.fromJson(x))),
        cartCount: json["cartCount"],
        wishilistCount: json["wishilistCount"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "trendingProducts":
            List<dynamic>.from(trendingProducts.map((x) => x.toJson())),
        "cartCount": cartCount,
        "wishilistCount": wishilistCount,
      };
}

class Banner {
  Banner({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerClass,
  });

  String id;
  String? title;
  String? description;
  String? bannerClass;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        bannerClass: json["class"] == null ? null : json["class"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "class": bannerClass == null ? null : bannerClass,
      };
}

class Category {
  Category({
    required this.id,
    required this.category,
    required this.brand,
  });

  String id;
  String category;
  String? brand;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        category: json["category"],
        brand: json["brand"] == null ? null : json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "brand": brand == null ? null : brand,
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
  int? offerPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        category: json["category"],
        brand: json["brand"],
        description: json["description"],
        orginalPrice: json["orginalPrice"],
        offerpercentage: json["offerpercentage"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "brand": brand,
        "description": description,
        "orginalPrice": orginalPrice,
        "offerpercentage": offerpercentage,
        "offerPrice": offerPrice == null ? null : offerPrice,
      };
}

class TrendingProduct {
  TrendingProduct({
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
  int? offerPrice;

  factory TrendingProduct.fromJson(Map<String, dynamic> json) =>
      TrendingProduct(
        id: json["_id"],
        category: json["category"],
        brand: json["brand"],
        description: json["description"],
        orginalPrice: json["orginalPrice"],
        offerpercentage: json["offerpercentage"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "brand": brand,
        "description": description,
        "orginalPrice": orginalPrice,
        "offerpercentage": offerpercentage,
        "offerPrice": offerPrice == null ? null : offerPrice,
      };
}
