import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';

class ContainerButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final double height;
  final double width;
  final IconData? containerIcon;
  final String buttonText;
  final Color buttonColor;
  final BorderRadius radius;
  const ContainerButton({
    Key? key,
    required this.height,
    required this.width,
    this.containerIcon,
    this.buttonColor = kConButonColor,
    required this.radius,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: buttonColor, borderRadius: radius),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(
          containerIcon,
          color: kWhite,
        ),
        label: Text(
          buttonText,
          style: const TextStyle(color: kWhite, fontSize: 12),
        ),
      ),
    );
  }
}
