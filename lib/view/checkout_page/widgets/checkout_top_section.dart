import 'package:flutter/cupertino.dart';
import 'package:menskart/view/address_page/add_address/add_address_page.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class CheckoutTopSection extends StatelessWidget {
  const CheckoutTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingText(headingText: 'Select Address'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.6,
              child: const ConfirmYellowButton(
                  buttonText: 'Add new Address',
                  buttonColor: kBackgroundGrey,
                  onPressed: AddAddressPage()),
            )
          ],
        ),
      ],
    );
  }
}
