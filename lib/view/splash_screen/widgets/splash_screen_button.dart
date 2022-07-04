
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/color_constants.dart';

class SplashScreenButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
final Widget buttonPress;
  const SplashScreenButton({
    Key? key,
    required this.backgroundColor,required this.textColor,required this.buttonText,required this.buttonPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 50,
        child: MaterialButton(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: kWhite)),
          onPressed: () {
          //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>buttonPress));
          Get.offAll(buttonPress);
          },
          child: Text(buttonText,style: TextStyle(color: textColor,fontSize: 20),),
        ),
      ),
    );
  }
}
