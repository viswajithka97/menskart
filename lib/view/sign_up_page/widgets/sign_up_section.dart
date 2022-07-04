import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/login_page/login_screen.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:menskart/view/widgets/form_field.dart';
import 'package:menskart/view/widgets/login_button.dart';

class SignUpSection extends StatelessWidget {
  final _nameContoller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();
   SignUpSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.8,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: kLoginCustom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            LoginFormField(
              formfieldtext: 'Full Name',
              controller: _nameContoller,
            ),
            LoginFormField(
              formfieldtext: 'Email',
              controller: _emailController,
            ),
            LoginFormField(
              formfieldtext: 'Password',
              controller: _passwordController,
            ),
            LoginFormField(
              formfieldtext: 'Confirm Password',
              controller: _confirmPasswordController,
            ),
            LoginFormField(
              formfieldtext: 'Mobile Number',
              controller: _mobileController,
            ),
            kHeight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.7,
                    child: Checkbox(
                        activeColor: kLoginBlue,
                        checkColor: kWhite,
                        splashRadius: 30,
                        tristate: false,
                        value: true,
                        onChanged: (bool? value) {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBlack,
                            fontSize: 15),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: kLoginBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kHeight10,
            LoginButton(
              buttonText: 'Sign Up',
              onPressed: (){},
              bgColor: kLoginBlue,
              textColor: kWhite,
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RichText(
                text: TextSpan(
                  text: 'Already Have an Account? ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: kBlack, fontSize: 20),
                  children: [
                    TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: kLoginBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offAll(LoginScreen());
                          }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
