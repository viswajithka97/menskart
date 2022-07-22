import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/address_controller/address_services/address_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/address_model/add_address_model.dart';
import 'package:menskart/model/address_model/edit_address_model.dart';
import 'package:menskart/model/address_model/get_all_address_model.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController {
  List<Address>? address;
  getAddress() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);
    try {
      final response = await AddressServices().getAddress(userId);
      if (response!.statusCode == 200) {
        final data = getAllAddressModelFromJson(response.data);
        address = data.address.obs;
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  addAddress(String name, String phoneNumber, String state, String pincode,
      String city, int houseNo, String houseName, String addressType) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);

    Map<String, dynamic> address = {
      "name": name,
      "userId": userId,
      "phoneNumber": phoneNumber,
      "house": houseNo,
      "address": houseName,
      "city": city,
      "pincode": pincode,
      "state": state,
      "location": addressType
    };
    log(address.toString());

    try {
      final response = await AddressServices().addAddress(address);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = addAddressModelFromJson(response.data);
        if (data.response.acknowledged) {
          Get.snackbar('Succes', "Yiour address has been added successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kGreen,
              colorText: kWhite,
              margin: const EdgeInsets.all(10));
          getAddress();
          update();
        } else {
          Get.snackbar('Error', "Please Check your Details",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: kWhite,
              margin: const EdgeInsets.all(10));
        }
      }
    } catch (e) {
      log('catch--------------------$e');
    }
  }

  editAddress(
      String name,
      String phoneNumber,
      String state,
      String pincode,
      String city,
      int houseNo,
      String houseName,
      String addressType,
      String addressId) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);

    Map<String, dynamic> address = {
      "name": name,
      "userId": userId,
      "phoneNumber": phoneNumber,
      "house": houseNo,
      "address": houseName,
      "city": city,
      "pincode": pincode,
      "state": state,
      "location": addressType
    };
    // log(address.toString());
    try {
      final response = await AddressServices().editAddress(address, addressId);
      if (response!.statusCode == 200) {
        final data = editAddressModelFromJson(response.data);
        if (data.resp.acknowledged) {
          Get.snackbar('Succes', "Yiour address has been updated successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kGreen,
              colorText: kWhite,
              margin: const EdgeInsets.all(10));
          getAddress();
          update();
        } else {
          Get.snackbar('Error', "Please Check your Details",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: kWhite,
              margin: const EdgeInsets.all(10));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
