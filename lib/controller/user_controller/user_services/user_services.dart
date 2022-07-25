import 'package:dio/dio.dart';
import 'package:menskart/view/core/url_constants.dart';

class UserServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      responseType: ResponseType.plain,
    ),
  );

  getProfileData(String userId) async {
    print('called');
    try {
      final response = await dio.get('user-profile/$userId');
      return response;
    } catch (e) {}
    return null;
  }
}
