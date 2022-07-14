
import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class HomePageApiServices {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  Future<Response<dynamic>?> getAllData() async {
    try {
      final response = await _dio.get(kBaseUrl);
      return response;
    } catch (e) {
      rethrow;
    } 
  }

}
