import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class AddressServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      responseType: ResponseType.plain,
    ),
  );

  Future<Response<dynamic>?> getAddress(userId) async {
    try {
      final response = await dio.get('user-profile/$userId');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response<dynamic>?> addAddress(Map<String, dynamic> address) async {
    try {
      final response = await dio.post('add-address', data: address);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

Future<Response<dynamic>?>  editAddress(Map<String, dynamic> address, String adressId) async {
   
    try {
      final response = await dio.post('edit-address/$adressId', data: address);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
