import 'package:flutter/material.dart';
import 'package:menskart/view/sign_up_page/widgets/sign_up_section.dart';
import 'package:menskart/view/sign_up_page/widgets/top_section.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:  [
        const  SignUpTopSection(),
          SignUpSection(),
        ],
      ),
    );
  }
}
