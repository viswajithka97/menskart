
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class 
CategoryApiServices{
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  
  Future <Response<dynamic>?> getCategoryData(String category) async {
    try {
      log('${kBaseUrl}category-view/$category');
      final response = await _dio.get('${kBaseUrl}category-view/$category');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}