import 'package:flutter/material.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/checkout_page/checkout_address_page.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/normal_heading_text.dart';

class CartBottomSection extends StatelessWidget {
  const CartBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NormalHeadingText(normalText: 'Summary'),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total No. of Items: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '2',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        const NormalHeadingText(normalText: 'Apply Coupon'),
        // kHeight5,
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: kBackgroundGrey,
                    filled: true,
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: kTransparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Enter Coupon Code',
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {},
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: kWhite, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Cost of Items: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '₹ 4480',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        kHeight10,
        const ConfirmYellowButton(
          buttonText: 'Proceed to Checkout',
          buttonColor: kYellow,
          onPressed: CheckoutAddressPage(),
        ),
      ],
    );
  }
}
