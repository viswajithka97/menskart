import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/wishlist_controller/wishlist_services/wishlist_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/wishlist_model/wishlist_add_model.dart';
import 'package:menskart/model/wishlist_model/wishlist_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistController extends GetxController {
  List<WishilistItem> wishlist = [];
  int? wishlistcount = 0;
  var isAdded = false.obs;

  deleteFromWishlist(String productId) async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final userId = sharedPrefs.getString(loginKey);
      Map<String, dynamic> id = {"proId": productId, "userId": userId};
      final response = await WishlistServices().addToWishlist(id);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = wishlistAddModelFromJson(response.data);
        log(data.status.toString());
        if (data.status == true) {
          update();

          Get.snackbar(
            'Success',
            'Product removed from wishlist',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  addToWishlist(String productId) async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final userId = sharedPrefs.getString(loginKey);
      Map<String, dynamic> id = {"proId": productId, "userId": userId};
      final response = await WishlistServices().addToWishlist(id);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = wishlistAddModelFromJson(response.data);
        log(data.status.toString());
        if (data.status == true) {
          Get.snackbar(
            'Success',
            'Product added to wishlist',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
          // update();
        } else {
          Get.snackbar(
            'Error',
            'Product already added to wishlist',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
        }
        // update();
      }
     
    } catch (e) {
      log(e.toString());
    }
  }

  getWishlist() async {
    print("object");
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final userId = sharedPrefs.getString(loginKey);
      final response = await WishlistServices().getWishlist(userId);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = wishlishtViewModelFromJson(response.data);
        wishlist = data.wishilistItems.obs;
        wishlistcount = data.wishilistCount;
        log(wishlistcount.toString());
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getWishlist();
    super.onInit();
  }
}
