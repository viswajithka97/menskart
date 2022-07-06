// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class AuthenicationApiCalls {
  final _dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
    responseType: ResponseType.plain,
  ));

  Future<Response<dynamic>?> loginCheck(Map<String, dynamic> login) async {
    try {
      var response = await _dio.post(
        'login',
        data: jsonEncode(login),
      );
      log(response.data);
      return response;
    } on DioError catch (e) {
      log(e.message);
      rethrow;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response<dynamic>?> signupCheck(Map<String, dynamic> signup) async {
    try {
      log('signup: $signup');
      var response = await _dio.post('signup', data: jsonEncode(signup));
      log('========${response.data}============');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  logoutCheck() {
    try {
      var response = _dio.get('logout');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
