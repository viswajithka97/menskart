import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/model/category_wise_product_model/category_wise_product_model.dart';
import 'package:menskart/view/checkout_page/widgets/checkout_address_container.dart';
import 'package:menskart/view/checkout_page/widgets/checkout_top_section.dart';
import 'package:menskart/view/checkout_page/widgets/payment_section.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_widget.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class CheckoutAddressPage extends StatelessWidget {
 
  const CheckoutAddressPage({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: SafeArea(
        child: ListView(
          children:const [
             CheckoutTopSection(),
             CheckoutAddressSelect(),
             HeadingText(headingText: 'Price Details'),
            PriceDetailsWidgets(),
             PaymentSection()
          ],
        ),
      ),
    );
  }
}
