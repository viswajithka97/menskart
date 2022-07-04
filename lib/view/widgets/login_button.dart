// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/border_radius.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;

  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? textColor;

  const LoginButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: bgColor, borderRadius: kBRadius30),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 17, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
