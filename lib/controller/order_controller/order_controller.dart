import 'dart:developer';

import 'package:get/get.dart';
import 'package:menskart/controller/order_controller/order_services/order_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/order_model/cancel_order_model.dart';
import 'package:menskart/model/order_model/order_details.dart';
import 'package:menskart/model/order_model/view_all_orders_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  List<Order>? orders;
  GetAllOrdersModelFromJson? checkResponse;
  int? orderlength;
  List<ProductElement>? products;

  getAllOrders() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);
    try {
      final response = await OrderServices().getAllOrders(userId!);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = getAllOrdersModelFromJsonFromJson(response.data);

        checkResponse = data;
        orders = data.orders.orders;
        orderlength = data.orders.orderLength;
        log(data.toString());
        update();
      }
    } catch (e) {
      log(" catch =-================$e");
    }
  }

  getOrderDetails(orderId) async {
    try {
      final response = await OrderServices().getOrderDetails(orderId);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = orderDetailsModelFromJson(response.data);
        if (data.products.isNotEmpty) {
          products = data.products.obs;
          // Get.to( OrderDetailsPage());
          update();
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  cancelOrder(String orderId) async {
    try {
      final response = await OrderServices().cancelOrder(orderId);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = orderCancelModelFromJson(response.data);
        if (data.status) {
          Get.defaultDialog();
          update();
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }
}
