import 'package:flutter/material.dart';
import 'package:menskart/view/checkout_page/widgets/checkout_address_container.dart';
import 'package:menskart/view/checkout_page/widgets/checkout_top_section.dart';

class AccountAddressPage extends StatelessWidget {
  const AccountAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const [
          CheckoutTopSection(),
          CheckoutAddressSelect(
            visibility: true,
          )
        ],
      ),
    );
  }
}
