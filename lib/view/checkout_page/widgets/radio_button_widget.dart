import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/view/core/color_constants.dart';

class RadioButtonWidget extends StatelessWidget {
  final String radioButtonText;
  final String buttonText;
  const RadioButtonWidget(
      {Key? key, required this.radioButtonText, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: GetBuilder<PlaceOrderController>(
          init: PlaceOrderController(),
          initState: (_) {},
          builder: (controller) {
            return RadioListTile(
              value: buttonText,
              groupValue: controller.select,
              onChanged: (value) {
                controller.radiobuttonSelected(value.toString());
                controller.update();
                print(value);
              },
              title: Text(radioButtonText),
            );
          },
        ));
  }
}
