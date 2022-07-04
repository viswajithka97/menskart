
import 'package:flutter/cupertino.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_details_text_widget.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: double.infinity,
      // color: kConBagColor,
      child: Column(
        children: const[
           OrderDetailsTextWidget(
            firstText: 'Order Placed On',
            secondText: 'June 29th',
          ),
           OrderDetailsTextWidget(
            firstText: 'Order Id ',
            secondText: '404-7991667-7972313',
          ),
           OrderDetailsTextWidget(
            firstText: 'Order Total',
            secondText: '₹ 2599',
          ),
        ],
      ),
    );
  }
}
