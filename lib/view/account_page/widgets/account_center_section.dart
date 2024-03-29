import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart/view/account_page/account_address_page/account_address_page.dart';
import 'package:menskart/view/account_page/order_page/order_page.dart';
import 'package:menskart/view/account_page/widgets/account_container_widget.dart';
import 'package:menskart/view/core/space_constants.dart';

class AccountCenterSection extends StatelessWidget {
  const AccountCenterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountContainerWidget(
            heading: 'My Addresses',
            buttonText: 'VIEW ALL ADDRESSES',
            onPressed: () {
              Get.to(const AccountAddressPage());
            }),
        kHeight10,
        AccountContainerWidget(
          heading: 'My Orders',
          buttonText: 'VIEW ALL ORDERS',
          onPressed: () {
            Get.to(const OrderPage());
          },
        ),
        // GetBuilder<OrderController>(
        //   init: OrderController(),
        //   builder: (controller) {
        //     if (controller.orders == null) {
        //       return const Center(child: CupertinoActivityIndicator());
        //     }
        //     return ;
        //   },
        // ),
        kHeight10,
        // const AccountContainerWidget(
        //     heading: 'Wallet',
        //     subHeading: '₹ 2250',
        //     buttonText: 'VIEW MY WALLET'),
      ],
    );
  }
}
