// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';

class LoginFormField extends StatelessWidget {
  final String formfieldtext;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final obsureText;

  const LoginFormField({
    Key? key,
    required this.formfieldtext,
    required this.controller,
    required this.validator,
    this.obsureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        obscureText: obsureText,
        decoration: InputDecoration(
            hintText: formfieldtext,
            filled: true,
            fillColor: kLoginColor,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: kTransparent),
              borderRadius: kBRadius30,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: kTransparent),
              borderRadius: kBRadius30,
            )),
      ),
    );
  }
}
