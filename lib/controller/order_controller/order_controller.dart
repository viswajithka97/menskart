import 'dart:developer';

import 'package:get/get.dart';
import 'package:menskart/controller/order_controller/order_services/order_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/order_model/view_all_orders_model.dart';
import 'package:menskart/view/account_page/order_page/order_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  List<Order>? orders;
  getAllOrders() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);
    try {
      final response = await OrderServices().getAllOrders(userId!);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = getAllOrdersModelFromJson(response.data);
        if (data.orders.isNotEmpty) {
          orders = data.orders.obs;
          Get.to(const OrderPage());
          update();
        }
      }
    } catch (e) {}
  }

  getOrderDetails(orderId) async {
    try {
      final response = await OrderServices().getOrderDetails(orderId);
      log(response!.data);
    } catch (e) {}
  }
}
