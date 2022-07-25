import 'package:flutter/material.dart';
import 'package:menskart/view/cart_page/widgets/cart_bottom_section.dart';
import 'package:menskart/view/cart_page/widgets/orders_container.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: const [
          HeadingText(
            headingText: 'Your Cart',
          ),
          OrdersContainer(),
          kHeight10,
          Divider(
            thickness: 2,
            color: kBlack,
          ),
          CartBottomSection()
        ],
      ),
    ));
  }
}
