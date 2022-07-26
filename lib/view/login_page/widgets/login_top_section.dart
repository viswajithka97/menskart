import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/color_constants.dart';

class LoginTopSection extends StatelessWidget {
  const LoginTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: -35,
          left: -30,
          child: Container(
            height: size!.width * 0.51,
            width: size!.width * 0.51,
            decoration: BoxDecoration(
                color: kLoginPurple, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Container(
            height: size!.width * 0.191,
            width: size!.width * 0.191,
            decoration: BoxDecoration(
                color: kLoginGrey, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          right: 10,
          child: SizedBox(
            height: size!.width * 0.382,
            width: size!.width * 0.382,
            child: Lottie.asset('assets/lottie/87718-waiting-register.json'),
          ),
        ),
      ],
    );
  }
}
