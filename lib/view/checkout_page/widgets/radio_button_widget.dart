import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final String radioButtonText;
  const RadioButtonWidget({Key? key, required this.radioButtonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? select;

    return SizedBox(
      height: 40,
      child: ListTile(
        leading: Radio(
          value: 'Cash On Delivery',
          groupValue: select,
          onChanged: (value) {
            select = value.toString();
          },
        ),
        title:  Text(radioButtonText),
      ),
    );
  }
}
