import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/authentication_controller/authentication_services/authentication_services.dart';
import 'package:menskart/main.dart';
import 'package:menskart/model/login_page/login_page_model.dart';
import 'package:menskart/model/signup_model/signup_model.dart';
import 'package:menskart/view/login_page/login_screen.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:menskart/view/main_page/widgets/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  var isLoading = false.obs;
  login(String email, String password) async {
    Map<String, dynamic> login = {"email": email, "password": password};
    isLoading.value = true;
    try {
      final response = await AuthenicationApiCalls().loginCheck(login);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        log('data undu.....');
        final data = loginModelFromJson(response.data);
        if (data.response.status == true && data.response.user.id.isNotEmpty) {
          // print('user id :${data.response.user.id}');
          Get.snackbar('Welcome ${data.response.user.name}', 'Login Successful',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              borderRadius: 10,
              borderColor: Colors.green,
              borderWidth: 2,
              duration: const Duration(seconds: 3));
          final sharedPrefs = await SharedPreferences.getInstance();
          sharedPrefs.setString(loginKey, data.response.user.id);
          // print(sharedPrefs.getString(loginKey));
          log('==============user login success==================');
          isLoading.value = false;
          update();
          Get.offAll(MainPage());
        } else {
          Get.snackbar('Error',
              'Email or Password is incorrect Please cheack and try again',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              borderRadius: 10,
              borderColor: Colors.red,
              borderWidth: 2,
              duration: const Duration(seconds: 3));
          isLoading.value = false;
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
      log(e.toString());
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
    try {
      final response = await AuthenicationApiCalls().signupCheck(signup);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = signUpModelFromJson(response.data);

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
    } catch (e) {
      log(e.toString());
    }
  }

  logout() async {
    try {
      final response = await AuthenicationApiCalls().logoutCheck();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        Get.off(() => LoginScreen());
        Get.snackbar(
            'Logout Successful', 'User has been logged out successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            borderRadius: 10,
            borderColor: Colors.green,
            borderWidth: 2,
            duration: const Duration(seconds: 3));
        final sharedPrefs = await SharedPreferences.getInstance();
        sharedPrefs.clear();
        indexChangedNotifier.value = 0;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
