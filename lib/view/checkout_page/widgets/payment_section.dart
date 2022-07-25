import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/checkout_page/widgets/radio_button_widget.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(headingText: 'Select Payment Methods'),
        const RadioButtonWidget(
          buttonText: 'COD',
          radioButtonText: 'Cash on Delivery',
        ),
        const RadioButtonWidget(
          buttonText: 'ONLINE',
          radioButtonText: 'RazorPay',
        ),
        const RadioButtonWidget(
          buttonText: 'PAYPAL',
          radioButtonText: 'Pay Pal',
        ),
        kHeight10,
        Center(
          child: GetBuilder<PlaceOrderController>(
            init: PlaceOrderController(),
            builder: (controller) {
              return ConfirmYellowButton(
                buttonText: 'Place Order',
                buttonColor: kLoginBlue,
                onPressed: () {
                  controller.placeOrder();
                },
                textColor: kWhite,
              );
            },
          ),
        )
      ],
    );
  }
}
