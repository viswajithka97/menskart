import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/authentication_controller/authentication_controller.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/login_page/widgets/login_leading_text.dart';
import 'package:menskart/view/sign_up_page/sign_up_screen.dart';
import 'package:menskart/view/widgets/form_field.dart';
import 'package:menskart/view/widgets/login_button.dart';

class LoginSection extends StatelessWidget {
  LoginSection({
    Key? key,
  }) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final loginController = Get.put(AuthenticationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            kHeight20,
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            LoginButton(
                bgColor: kLoginColor,
                buttonText: 'Sign in with Mobile',
                onPressed: () {}),
            kHeight10,
            Row(
              children: const [
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                kWidth10,
                Text(
                  'or Sign in with Email',
                  style: TextStyle(fontSize: 17),
                ),
                kWidth10,
                Expanded(
                    child: Divider(
                  thickness: 2,
                ))
              ],
            ),
            kHeight20,
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginLeadingText(leadingText: 'Email'),
                  LoginFormField(
                    formfieldtext: 'mail@website.com',
                    controller: _emailController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  kHeight20,
                  const LoginLeadingText(leadingText: 'Password'),
                  LoginFormField(
                    formfieldtext: 'Password',
                    controller: _passwordController,
                    obsureText: true,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
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
                  const Text(
                    'Remember Me.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kLoginBlue),
                  )
                ],
              ),
            ),
            kHeight20,
            LoginButton(
              buttonText: 'Sign In',
              onPressed: () {
                final FormState? form = _formKey.currentState;
                if (form!.validate()) {
                  loginController.login(
                      _emailController.text, _passwordController.text);
                } else {
                  Get.snackbar('Error', 'Please Enter Email and Password',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      borderRadius: 10,
                      borderColor: Colors.red,
                      borderWidth: 2,
                      duration: const Duration(seconds: 3));
                }
              },
              bgColor: kLoginBlue,
              textColor: kWhite,
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RichText(
                text: TextSpan(
                  text: 'Not Registered Yet? ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: kBlack, fontSize: 20),
                  children: [
                    TextSpan(
                        text: 'Create an Account',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: kLoginBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offAll(const SignUpPage());
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

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }
}
