import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class PlaceOrderServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      responseType: ResponseType.plain,
    ),
  );
  Future<Response<dynamic>?> placeOrder(
      Map<String, dynamic> order, userId) async {
    try {
      final response = await dio.post(
        'place-order/$userId',
        data: order,
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $userId',
        //   },
        // ),
      );
      return response;
    } catch (e) {
      log("second catch ==============$e");
    }
    return null;
  }

  Future<Response<dynamic>?> applyCoupon(
      String userId, String couponCode, int totalAmount) async {
    try {
      final response = await dio.post('applyCoupon/$userId',
          data: jsonEncode(
            {'code': couponCode, "total": totalAmount},
          ));
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
