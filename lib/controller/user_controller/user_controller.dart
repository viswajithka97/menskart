import 'dart:developer';

import 'package:get/get.dart';
import 'package:menskart/controller/user_controller/user_services/user_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  List<Address>? address;

  getProfile() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString(loginKey);
    try {
      final response = await UserServices().getProfileData(userId!);
      log(response!.data);
      if (response.statusCode == 200) {
        final data = userProfileModelFromJson(response.data);
        if (data.user.isNotEmpty) {
          address = data.address.obs;
          update();
        }
      }
    } catch (e) {}
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
