// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';

class AuthenicationApiCalls {
  final _dio = Dio(BaseOptions(
    baseUrl: 'http://52.73.88.3/',
    responseType: ResponseType.plain,
  ));
  Future<Response<dynamic>?> loginCheck(Map<String, dynamic> login) async {
    // log('message: $login');

    try {
      var response = await _dio.post(
        'login',
        data: login,
        // {"email": "viswajith@gmail.com", "password": "12345"},
      );
      // var response = await _dio.get(
      //   'http://52.73.88.3/logout',
      // );

      return response;
    } on DioError catch (e) {
      log(e.message);
      rethrow;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  logoutCheck() {
    try {
      var response = _dio.get('logout');
      return response;
    } catch (e) {}
  }
}
