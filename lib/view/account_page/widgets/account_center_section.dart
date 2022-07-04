import 'package:flutter/cupertino.dart';
import 'package:menskart/view/account_page/account_address_page/account_address_page.dart';
import 'package:menskart/view/account_page/order_page/order_page.dart';
import 'package:menskart/view/account_page/widgets/account_container_widget.dart';
import 'package:menskart/view/core/space_constants.dart';

class AccountCenterSection extends StatelessWidget {
  const AccountCenterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        AccountContainerWidget(
            heading: 'My Addresses', buttonText: 'VIEW ALL ADDRESSES',onPressed: AccountAddressPage(),),
        kHeight10,
        AccountContainerWidget(
            heading: 'My Orders', buttonText: 'VIEW ALL ORDERS',onPressed: OrderPage(),),
        kHeight10,
        AccountContainerWidget(
            heading: 'Wallet',
            subHeading: '₹ 2250',
            buttonText: 'VIEW MY WALLET'),
      ],
    );
  }
}