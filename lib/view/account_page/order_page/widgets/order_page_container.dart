import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/order_controller/order_controller.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/order_details_page.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';

class OrderPageContainer extends StatelessWidget {
  const OrderPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
       
        if (controller.checkResponse == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.orderlength == 0) {
          print('order length is zero');
           print(controller.checkResponse);
          return const Center(child: Text('No Orders Yet'));
        } else {
          print("data undu");
          return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.orders!.length,
              itemBuilder: (context, index) {
                final orders = controller.orders![index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.getOrderDetails(orders.id);
                      Get.to(OrderDetailsPage(orders: orders));
                      // log(orders.products[index].item);
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: kBRadius15, color: kConBagColor),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 80,
                          width: 210,
                          // color: kBlack,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                orders.id,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              // kHeight10,
                              Text(
                                orders.status!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green),
                              ),
                              // kHeight10,
                              Text(orders.totalAmount.toString())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
