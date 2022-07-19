import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class CartServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      responseType: ResponseType.plain,
    ),
  );

  Future<Response<dynamic>?> addToCart(Map<String, dynamic> id) async {
    try {
      final response = await dio.post('add-to-cart/', data: id);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> getCart(String id) async {
    print('${kBaseUrl}cart/$id');
    try {
      log(id.toString());
      final response = await dio.get('cart/$id');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> removeProduct(Map<String, dynamic> id) async {
    try {
      print(id);
      final response = await dio.post('remove-product-cart', data: id);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> updateProductQuantity(
      Map<String, dynamic> id) async {
    try {
      print(id);
      final response = await dio.post('change-product-quantity', data: id);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
