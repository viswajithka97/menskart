import 'package:flutter/cupertino.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/login_page/login_screen.dart';
import 'package:menskart/view/select_login/widgets/select_login_option_button.dart';
import 'package:menskart/view/sign_up_page/sign_up_screen.dart';

class SelectLoginOptionWidget extends StatelessWidget {
  const SelectLoginOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        const SelectoginScreenButton(
          backgroundColor: kWhite,
          buttonText: 'Sign Up',
          textColor: kBlack,
          buttonPress: SignUpPage(),
        ),
        kHeight20,
        SelectoginScreenButton(
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
