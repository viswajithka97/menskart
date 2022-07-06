import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/authentication_controller/authentication_services/authentication_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/login_page/login_page_model.dart';
import 'package:menskart/model/signup_model/signup_model.dart';
import 'package:menskart/view/login_page/login_screen.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  login(String email, String password) async {
    Map<String, dynamic> login = {"email": email, "password": password};

    try {
      final response = await AuthenicationApiCalls().loginCheck(login);

      if (response!.data == null) {
        Get.snackbar('Error',
            'Email or Password is incorrect Please cheack and try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            borderRadius: 10,
            borderColor: Colors.red,
            borderWidth: 2,
            duration: const Duration(seconds: 3));
      } else {
        final data = loginModelFromJson(response.data);
        if (data.response.status) {
          Get.offAll(MainPage());
          Get.snackbar('Welcome ${data.response.user.name}', 'Login Successful',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              borderRadius: 10,
              borderColor: Colors.green,
              borderWidth: 2,
              duration: const Duration(seconds: 3));
          final sharedPrefs = await SharedPreferences.getInstance();
          sharedPrefs.setBool(loginKey, true);
          log('==============user login success==================');
        }
      }
    } catch (e) {
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

  signup(name, email, password, confirmPassword, phoneNumber) async {
    Map<String, dynamic> signup = {
      "name": name,
      "email": email,
      "password": password,
      "conformPassword": confirmPassword,
      "phoneNumber": phoneNumber
    };

    final response = await AuthenicationApiCalls().signupCheck(signup);

    final data = signUpModelFromJson(response!.data);

    if (data.response.acknowledged) {
      log('---------signup success--------');
      Get.off(() => LoginScreen());
      Get.snackbar('Signup Successfull', 'User has been created',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          borderColor: Colors.green,
          borderWidth: 2,
          duration: const Duration(seconds: 3));
    }
  }

  logout() async {
    log('==================logout called==================');

    final response = await AuthenicationApiCalls().logoutCheck();

    if (response != null) {
      Get.off(() => LoginScreen());
      Get.snackbar('Logout Successful', 'User has been logged out successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          borderColor: Colors.green,
          borderWidth: 2,
          duration: const Duration(seconds: 3));
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.clear();
    }
  }
}
    
    
    // }
    //  catch (e) {
    //   print('--------------------$e===============');
    // }

  