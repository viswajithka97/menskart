
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/color_constants.dart';

class AccountContainerWidget extends StatelessWidget {
  final String heading;
  final subHeading;
  final String buttonText;
  
  final VoidCallback? onPressed;
  const AccountContainerWidget({
    Key? key, required this.heading, this.subHeading, required this.buttonText, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: kBackgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                 heading,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                 if(subHeading!=null)
                  Text(
                    subHeading,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [GestureDetector(
                onTap: onPressed,
                child:  Text(buttonText,style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))],
            )
          ],
        ),
      ),
    );
  }
}