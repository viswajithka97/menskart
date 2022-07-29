import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menskart/controller/place_order_controller/place_order_services/place_order_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/address_model/get_all_address_model.dart';
import 'package:menskart/model/coupon_model.dart/apply_coupon_model.dart';
import 'package:menskart/model/payment/cod_model.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_widget.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:menskart/view/main_page/widgets/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaceOrderController extends GetxController {
  Rx<int>? offerPrice;
  String? select;
  int? selectIndex;
  AddressClass? address;

  radiobuttonSelected(String value) {
    select = value;
    log(select.toString());
    update();
  }

  placeOrder() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);

    Map<String, dynamic> order = {
      "checkoutAddress": address!.useraddress,
      "name": address!.name,
      "userId": userId,
      "total": totalPrice,
      "payment-method": select
    };

    try {
      final response = await PlaceOrderServices().placeOrder(order, userId);
      log(response!.data.toString());
      if (response.statusCode == 200) {
        if (select == "COD") {
          final data = codModelFromJson(response.data);
          if (data.codSuccess) {
            showGeneralDialog(
              context: Get.context!,
              barrierLabel: "Barrier",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 1500),
              pageBuilder: (_, __, ___) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      indexChangedNotifier.value = 0;
                      Get.offAll(MainPage());
                    },
                    child: Container(
                      height: 240,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: SizedBox.expand(
                          child: Lottie.asset(
                              'assets/lottie/104369-check-motion.json')),
                    ),
                  ),
                );
              },
              transitionBuilder: (_, anim, __, child) {
                Tween<Offset> tween;
                if (anim.status == AnimationStatus.reverse) {
                  tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
                } else {
                  tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
                }

                return SlideTransition(
                  position: tween.animate(anim),
                  child: FadeTransition(
                    opacity: anim,
                    child: child,
                  ),
                );
              },
            );
          }
        }
      }
    } catch (e) {
      log("first catch ==============$e");
    }
  }

  containerColorChange(index, AddressClass adress) {
    selectIndex = index;
    address = adress;
    update();
  }

  applyCoupon(String couponCode, int totalAmount) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);

    try {
      final response = await PlaceOrderServices()
          .applyCoupon(userId!, couponCode, totalAmount);

      log(response!.data);
      if (response.statusCode == 200) {
        final data = applyCouponModelFromJson(response.data);
        if (data.user == true) {
          offerPrice = data.offerprice!.obs;
          Get.snackbar('Succes', "Coupon applied successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kGreen,
              colorText: kWhite,
              margin: const EdgeInsets.all(10));
          update();
        } else {
          offerPrice = data.offerprice!.obs;
          Get.snackbar(
            'Error',
            "Coupon already applied",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: kWhite,
          );
          update();
        }
      }
    } catch (e) {
      log("---------catch--------------${e.toString()}");
    }
  }
}
