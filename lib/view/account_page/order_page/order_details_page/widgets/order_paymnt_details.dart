import 'package:flutter/material.dart';
import 'package:menskart/model/order_model/view_all_orders_model.dart';
import 'package:menskart/view/core/color_constants.dart';

class OrderPaymentDetails extends StatelessWidget {
  final Order? order;
  const OrderPaymentDetails({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final address = order!.deliveryDetails;

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: kBlack)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(order!.paymentMethode,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: kBlack,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              '${order!.user}\nHouse No: ${address.houseNo}\n${address.address} \n${address.city}\n${address.state} - ${address.pincode}\nPhone: +91 ${address.mobile}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
