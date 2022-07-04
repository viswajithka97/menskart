import 'package:flutter/material.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';

class LoginFormField extends StatelessWidget {
  final String formfieldtext;
  final TextEditingController controller;

  const LoginFormField({
    Key? key,
    required this.formfieldtext,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: controller,
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
