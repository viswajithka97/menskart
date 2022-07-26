// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:menskart/view/select_login/select_login_option_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    checkUserLogin();
    return Container();
  }

  Future<void> checkUserLogin() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userSignIn = sharedPrefs.getString(loginKey);
    log(userSignIn.toString());

    if (userSignIn == null || userSignIn == false) {
      Get.offAll(() => const SelectLoginOption());
    } else {
      Get.offAll(() => MainPage());
    }
  }
}
