import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/payment_controller/payment_controller.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/checkout_page/widgets/radio_button_widget.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class PaymentSection extends StatelessWidget {
  PaymentSection({Key? key}) : super(key: key);
  final PaymentController paymentController = Get.put(PaymentController());
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
        kHeight20,
        Center(
          child: GetBuilder<PlaceOrderController>(
            init: PlaceOrderController(),
            builder: (controller) {
              return ConfirmYellowButton(
                buttonText: 'Place Order',
                buttonColor: kLoginBlue,
                onPressed: () {
                  if (controller.select == "ONLINE") {
                    paymentController.openCheckout();
                  } else if (controller.select == "COD") {
                    controller.placeOrder();
                  } else if (controller.select == "PAYPAL") {
                    // paymentController.payPal();
                  }

                  // }
                  // controller.placeOrder();
                },
                textColor: kWhite,
              );
            },
          ),
        ),
        kHeight10
      ],
    );
  }
}
