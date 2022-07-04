// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/color_constants.dart';

class ConfirmYellowButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color? textColor;
  final onPressed;

  const ConfirmYellowButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    this.onPressed,
    this.textColor = kBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.9,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: buttonColor,
          onPressed: () {
            if (onPressed != null) {
              Get.to(onPressed);
            } else {
              Get.back();
            }
          },
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
