
import 'package:flutter/cupertino.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/checkout_page/widgets/radio_button_widget.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class PaymentSection
 extends StatelessWidget {
  const PaymentSection
  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
             HeadingText(headingText: 'Select Payment Methods'),
             RadioButtonWidget(
              radioButtonText: 'Cash on Delivery',
            ),
             RadioButtonWidget(
              radioButtonText: 'RazorPay',
            ),
             RadioButtonWidget(
              radioButtonText: 'Pay Pal',
            ),
             ConfirmYellowButton(
              buttonText: 'Place Order',
              buttonColor: kLoginBlue,
              onPressed: '',
              textColor: kWhite,
            )
      ],
    );
  }
}