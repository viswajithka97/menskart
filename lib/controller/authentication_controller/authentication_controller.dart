import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/authentication_controller/authentication_services/authentication_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/login_page/login_page_model.dart';
import 'package:menskart/view/login_page/login_screen.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  // void onInit() {
  //   super.onInit();
  // }

  login(String email, String password) async {
    Map<String, dynamic> login = {"email": email, "password": password};

    // try {
    final response = await AuthenicationApiCalls().loginCheck(login);
    final data = loginModelFromJson(response!.data);
    if (data.response.status) {
      Get.off(MainPage());
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool(loginKey, true);
      log('==============user login success==================');
    } else {
      Get.snackbar(
          'Error', 'Email or Password is incorrect Please cheack and try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          borderColor: Colors.red,
          borderWidth: 2,
          duration: const Duration(seconds: 3));
    }
  }

  logout() async {
    log('==================logout called==================');

    final response = await AuthenicationApiCalls().logoutCheck();

    if (response != null) {
      Get.off(() => LoginScreen());
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.clear();
    }
  }
} 

    
    
    // }
    //  catch (e) {
    //   print('--------------------$e===============');
    // }

  