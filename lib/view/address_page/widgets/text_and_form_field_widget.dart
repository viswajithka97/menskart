// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';

class TextandFormFieldWidget extends StatelessWidget {
  final headingText;
  final hintText;
  final controller;
  const TextandFormFieldWidget(
      {Key? key,
      required this.headingText,
      required this.hintText,
     required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(headingText),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: kBackgroundGrey.withOpacity(0.5),
                filled: true,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0, color: kTransparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: hintText,
              ),
            ),
          ),
        ),
        kHeight10,
      ],
    );
  }
}
