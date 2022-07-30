import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class OrderServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      responseType: ResponseType.plain,
    ),
  );

  Future<Response<dynamic>?> getAllOrders(String userId) async {
    log(userId);
    try {
      final response = await dio.get('orders/$userId');
      return response;
    } catch (e) {
      log("calling error ----------$e");
    }
    return null;
  }

  Future<Response<dynamic>?> getOrderDetails(String orderId) async {
    try {
      final response = await dio.get('view-order-products/$orderId');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> cancelOrder(String orderId) async {
    try {
      final response = await dio.post('cancel-orders',
          data: jsonEncode({'orderId': orderId}));
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
