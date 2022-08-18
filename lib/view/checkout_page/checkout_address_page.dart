import 'package:flutter/material.dart';
import 'package:menskart/view/checkout_page/widgets/checkout_address_container.dart';
import 'package:menskart/view/checkout_page/widgets/checkout_top_section.dart';
import 'package:menskart/view/checkout_page/widgets/payment_section.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_widget.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class CheckoutAddressPage extends StatelessWidget {
  const CheckoutAddressPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Checkout Page'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const CheckoutTopSection(),
            const CheckoutAddressSelect(),
            const HeadingText(headingText: 'Price Details'),
            const PriceDetailsWidgets(),
            PaymentSection()
          ],
        ),
      ),
    );
  }
}
