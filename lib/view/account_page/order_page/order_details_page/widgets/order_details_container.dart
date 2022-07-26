import 'package:flutter/cupertino.dart';
import 'package:menskart/model/order_model/order_details.dart';
import 'package:menskart/model/order_model/view_all_orders_model.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_details_text_widget.dart';

class OrderDetailsContainer extends StatelessWidget {
  final Order? order;
  final List<ProductElement>? product;
  const OrderDetailsContainer({
    Key? key,
    required this.order,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: double.infinity,
      // color: kConBagColor,
      child: Column(
        children: [
          OrderDetailsTextWidget(
            firstText: 'Order Placed On',
            secondText: order!.orderDate,
          ),
          OrderDetailsTextWidget(
            firstText: 'Order Id ',
            secondText: product![0].id,
          ),
          OrderDetailsTextWidget(
            firstText: 'Order Total',
            secondText: '₹ ${order!.totalAmount}',
          ),
        ],
      ),
    );
  }
}
