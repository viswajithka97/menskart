
import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) =>
    GetAllAddressModel.fromJson(json.decode(str));

String getAllAddressModelToJson(GetAllAddressModel data) =>
    json.encode(data.toJson());

class GetAllAddressModel {
  GetAllAddressModel({
    required this.user,
    required this.address,
    required this.cartCount,
    required this.wishilistCount,
  });

  String user;
  List<Address> address;
  int cartCount;
  int wishilistCount;

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAllAddressModel(
        user: json["user"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
        cartCount: json["cartCount"],
        wishilistCount: json["wishilistCount"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
        "cartCount": cartCount,
        "wishilistCount": wishilistCount,
      };
}

class Address {
  Address({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.conformPassword,
    required this.phoneNumber,
    required this.address,
  });

  String id;
  String name;
  String email;
  String password;
  String conformPassword;
  String phoneNumber;
  AddressClass address;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        conformPassword: json["conformPassword"],
        phoneNumber: json["phoneNumber"],
        address: AddressClass.fromJson(json["Address"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "conformPassword": conformPassword,
        "phoneNumber": phoneNumber,
        "Address": address.toJson(),
      };
}

class AddressClass {
  AddressClass({
    required this.useraddress,
    required this.name,
    required this.phoneNumber,
    required this.state,
    required this.pincode,
    required this.house,
    required this.city,
    required this.home,
    required this.address,
  });

  String useraddress;
  String name;
  String phoneNumber;
  String state;
  String pincode;
  int house;
  String city;
  String home;
  String address;

  factory AddressClass.fromJson(Map<String, dynamic> json) => AddressClass(
        useraddress: json["Useraddress"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        state: json["state"],
        pincode: json["pincode"],
        house: json["house"],
        city: json["city"],
        home: json["home"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "Useraddress": useraddress,
        "name": name,
        "phoneNumber": phoneNumber,
        "state": state,
        "pincode": pincode,
        "house": house,
        "city": city,
        "home": home,
        "address": address,
      };
}
