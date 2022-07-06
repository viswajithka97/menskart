// To parse this JSON data, do
//
//     final categoryWiseProductModel = categoryWiseProductModelFromJson(jsonString);

import 'dart:convert';

CategoryWiseProductModel categoryWiseProductModelFromJson(String str) => CategoryWiseProductModel.fromJson(json.decode(str));

String categoryWiseProductModelToJson(CategoryWiseProductModel data) => json.encode(data.toJson());

class CategoryWiseProductModel {
    CategoryWiseProductModel({
        required this.products,
    });

    List<Product> products;

    factory CategoryWiseProductModel.fromJson(Map<String, dynamic> json) => CategoryWiseProductModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
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
    Category? category;
    Brand? brand;
    String description;
    String orginalPrice;
    String offerpercentage;
    int? offerPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        category: categoryValues.map![json["category"]],
        brand: brandValues.map![json["brand"]],
        description: json["description"],
        orginalPrice: json["orginalPrice"],
        offerpercentage: json["offerpercentage"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": categoryValues.reverse[category],
        "brand": brandValues.reverse[brand],
        "description": description,
        "orginalPrice": orginalPrice,
        "offerpercentage": offerpercentage,
        "offerPrice": offerPrice == null ? null : offerPrice,
    };
}

enum Brand { SPYKAR }

final brandValues = EnumValues({
    "Spykar": Brand.SPYKAR
});

enum Category { JEANS }

final categoryValues = EnumValues({
    "Jeans": Category.JEANS
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map!.map((k, v) =>  MapEntry(v, k));
        return reverseMap!;
    }
}
