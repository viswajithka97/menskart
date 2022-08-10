import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class WishlistServices {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://52.73.88.3/', responseType: ResponseType.plain));

  Future<Response<dynamic>?> addToWishlist(Map<String, dynamic> id) async {
    try {
      final response = await dio.post('add-wishilist', data: jsonEncode(id));
      log(response.data);
      return response;
    } catch (e) {
      DioError;
    }
    return null;
  }

  Future<Response<dynamic>?> getWishlist(id) async {
    try {
      final response = await dio.get(
        'wishilist-view/$id',
      );

      return response;
    } catch (e) {
      DioError;
    }
    return null;
  }
}
