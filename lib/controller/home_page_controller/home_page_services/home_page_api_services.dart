import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class HomePageApiServices {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  Future<Response<dynamic>?> getAllData() async {
    try {
      final response = await _dio.get(kBaseUrl);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> getAllCoupons() async {
    try {
      final response = await _dio.get("${kBaseUrl}admin/view-coupon");

      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
