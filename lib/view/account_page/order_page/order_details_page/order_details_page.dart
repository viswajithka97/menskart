import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/order_controller/order_controller.dart';
import 'package:menskart/model/order_model/view_all_orders_model.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_container.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_details_container.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_paymnt_details.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/widgets/order_tracking_widget.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order? orders;
  const OrderDetailsPage({Key? key, this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<OrderController>(
          init: OrderController(),
          builder: (controller) {
            return ListView(
              children: [
                const HeadingText(headingText: 'View Order Details'),
                const OrderTrackingWidget(),
                OrderContainer(product: controller.products),
                kHeight10,
                OrderDetailsContainer(
                    order: orders, product: controller.products),
                kHeight10,
                const HeadingText(headingText: 'Payment and Delivery Details'),
                OrderPaymentDetails(order: orders),
                kHeight5,
                ConfirmYellowButton(
                    buttonText: "Cancel Order",
                    buttonColor: kLoginBlue,
                    onPressed: () {
                      controller.cancelOrder(orders!.id);
                    })
              ],
            );
          },
        ),
      )),
    );
  }
}
