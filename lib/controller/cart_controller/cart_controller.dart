import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/cart_controller/cart_services/cart_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/cart_model/add_to_cart_,model.dart';
import 'package:menskart/model/cart_model/change_quantity_model.dart';
import 'package:menskart/model/cart_model/remove_product_model.dart';
import 'package:menskart/model/cart_model/view_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  List<ProductElement>? products;

  getCartItems() async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final userId = sharedPrefs.getString(loginKey);

      final response = await CartServices().getCart(userId!);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = viewCartModelFromJson(response.data);
        products = data.products.obs;
        update();
      }
    } catch (e) {
      log('catch  $e ');
    }
  }

  addToCart(productId) async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final userId = sharedPrefs.getString(loginKey);
      Map<String, dynamic> id = {"productId": productId, "userId": userId};
      final response = await CartServices().addToCart(id);
      log(response!.data.toString());
      if (response.statusCode == 200) {
        final data = addToCartModelFromJson(response.data);
        if (data.status) {
          Get.snackbar(
            'Success',
            'Product added to cart',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            snackStyle: SnackStyle.FLOATING,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            snackStyle: SnackStyle.FLOATING,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Something went wrong',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          // borderRadius: BorderRadius.circular(10),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        // borderRadius: BorderRadius.circular(10),
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
      );
    }
  }

  deleteProductFromCart(String productId, String cartId) async {
    Map<String, dynamic> id = {"product": productId, "cart": cartId};
    try {
      final response = await CartServices().removeProduct(id);
      print(response!.data);

      if (response.statusCode == 200) {
        final data = removeProductCartModelFromJson(response.data);
        if (data.response.acknowledged) {
          update();
          Get.snackbar(
            'Success',
            'Product removed from cart',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            snackStyle: SnackStyle.FLOATING,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            snackStyle: SnackStyle.FLOATING,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2),
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Something went wrong',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          // borderRadius: BorderRadius.circular(10),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      log('catch =============$e');
    }
  }

  productQuantity(
      String prdouctId, String cartId, int count, int quantity) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);
    Map<String, dynamic> id = {
      "user": userId,
      "cart": cartId,
      "product": prdouctId,
      "count": count,
      "quantity": quantity
    };
    try {
      final response = await CartServices().updateProductQuantity(id);

      print(response!.data);

      if (response.statusCode == 200) {
        final data = changeQuantityModelFromJson(response.data);
        if (data.response.status) {
          getCartItems();
          update();
        }
      }
    } catch (e) {
      log('catch =============$e');
    }
  }

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }
}
