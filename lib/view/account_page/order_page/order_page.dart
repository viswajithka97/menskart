import 'package:flutter/material.dart';
import 'package:menskart/view/account_page/order_page/widgets/order_page_container.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeadingText(headingText: 'Order History'),
          Expanded(
            child: OrderPageContainer(),
          )
        ],
      )),
    );
  }
}
