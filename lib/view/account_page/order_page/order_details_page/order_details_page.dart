import 'package:flutter/material.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_container.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_details_container.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_paymnt_details.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_tracking_widget.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            HeadingText(headingText: 'View Order Details'),
            OrderContainer(),
            kHeight10,
            OrderDetailsContainer(),
            kHeight10,
            HeadingText(headingText: 'Payment and Delivery Details'),
            OrderPaymentDetails(),
            kHeight5,
            OrderTrackingWidget(),
          ],
        ),
      )),
    );
  }
}
