
import 'package:flutter/cupertino.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_text_widget.dart';
import 'package:menskart/view/core/color_constants.dart';

class PriceDetailsWidgets extends StatelessWidget {
  const PriceDetailsWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.95,
        color: kBackgroundGrey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              PriceDetails(
                priceName: 'Coupon Discount',
                price: '₹ 1500',
              ),
              PriceDetails(
                priceName: 'Shipment Charges',
                price: 'Free',
              ),
              PriceDetails(
                priceName: 'Delivery Charges',
                price: 'Free',
              ),
              PriceDetails(
                priceName: 'Total Amount\n(Including Gst)',
                price: '₹ 2240',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
