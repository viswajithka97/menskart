import 'dart:convert';

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
    try {
      final response = await dio.get('orders/$userId');
      return response;
    } catch (e) {}
    return null;
  }

  Future<Response<dynamic>?> getOrderDetails(String orderId) async {
    print(orderId);
    try {
      final response = await dio.get('view-order-products/$orderId');
      return response;
    } catch (e) {}
    return null;
  }

  Future<Response<dynamic>?> cancelOrder(String orderId) async {
    print(orderId);
    try {
      final response = await dio.post('cancel-orders',
          data: jsonEncode({'orderId': orderId}));
      return response;
    } catch (e) {}
    return null;
  }
}
