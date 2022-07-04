import 'package:flutter/cupertino.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/login_page/login_screen.dart';
import 'package:menskart/view/sign_up_page/sign_up_screen.dart';
import 'package:menskart/view/splash_screen/widgets/splash_screen_button.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        const SplashScreenButton(
          backgroundColor: kWhite,
          buttonText: 'Sign Up',
          textColor: kBlack,
          buttonPress: SignUpPage(),
        ),
        kHeight20,
        SplashScreenButton(
          backgroundColor: kTransparent,
          buttonText: 'Sign In',
          textColor: kWhite,
          buttonPress: LoginScreen(),
        ),
        kHeight20
      ],
    );
  }
}
