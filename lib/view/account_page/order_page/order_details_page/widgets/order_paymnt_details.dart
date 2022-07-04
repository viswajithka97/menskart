import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';

class OrderPaymentDetails extends StatelessWidget {
  const OrderPaymentDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: const [
                Text(
                  'Payment Method',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Cash on Delivery',
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Viswajith K A\nHouse No: 12\nAiswarya Nagar \nThammadiyill Temple Road\nThripunitura\nKerala - 682301\nPhone: +91 9447617999',
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