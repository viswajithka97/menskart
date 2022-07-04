import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:menskart/view/core/color_constants.dart';

class SignUpTopSection extends StatelessWidget {
  const SignUpTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: -16,
          left: -10,
          child: Container(
            height: size.width * 0.382,
            width: size.width * 0.382,
            decoration: BoxDecoration(
                color: kLoginPurple, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Container(
            height: size.width * 0.166,
            width: size.width * 0.166,
            decoration: BoxDecoration(
                color: kLoginGrey, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 60,
          left: 140,
          child: Container(
            height: size.width * 0.191,
            width: size.width * 0.191,
            decoration: BoxDecoration(
                color: kLoginPurplewithOpacity,
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 78,
          left: 158,
          child: Container(
            height: size.width * 0.102,
            width: size.width * 0.102,
            decoration: BoxDecoration(
                color: kLoginGrey, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 90,
          left: 220,
          child: Container(
            height: size.width * 0.102,
            width: size.width * 0.102,
            decoration: BoxDecoration(
                color: kLoginPurplewithOpacity,
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 100,
          left: 230,
          child: Container(
            height: size.width * 0.051,
            width: size.width * 0.051,
            decoration: BoxDecoration(
                color: kLoginGrey, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            height: size.width * 0.382,
            width: size.width * 0.382,
            child: Lottie.asset(
                'assets/lottie/37874-the-man-carrying-the-purchases-shopping.json'),
          ),
        ),
      ],
    );
  }
}
