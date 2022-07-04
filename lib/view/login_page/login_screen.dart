import 'package:flutter/material.dart';
import 'package:menskart/view/login_page/widgets/login_section.dart';
import 'package:menskart/view/login_page/widgets/login_top_section.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:  [
         const LoginTopSection(),
          LoginSection(),
        ],
      ),
    );
  }
}
