import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/cart_controller/cart_controller.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/model/category_wise_product_model/category_wise_product_model.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_text_widget.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';

int totalPrice = 0;

class PriceDetailsWidgets extends StatelessWidget {
  const PriceDetailsWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration:
            BoxDecoration(borderRadius: kBRadius10, color: kBackgroundGrey),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GetBuilder<PlaceOrderController>(
                init: PlaceOrderController(),
                builder: (orderController) {
                  return PriceDetails(
                    priceName: 'Coupon Discount',
                    price:
                        '₹ ${orderController.offerPrice == null ? 0 : orderController.offerPrice}',
                  );
                },
              ),
              const PriceDetails(
                priceName: 'Shipment Charges',
                price: 'Free',
              ),
              const PriceDetails(
                priceName: 'Delivery Charges',
                price: 'Free',
              ),
              GetBuilder<PlaceOrderController>(
                init: PlaceOrderController(),
                builder: (controller) {
                  final cartController = Get.put(CartController());

                  if (controller.offerPrice != null) {
                    final price =
                        int.parse(cartController.totalValue.toString()) -
                            int.parse(controller.offerPrice.toString());
                    totalPrice = price;
                    return PriceDetails(
                      priceName: 'Total Amount\n(Including GST)',
                      price: "₹ $price",
                      fontWeight: FontWeight.bold,
                    );
                  } else {
                    totalPrice = cartController.totalValue!.toInt();
                    return PriceDetails(
                      priceName: 'Total Amount\n(Including GST)',
                      price: '₹ ${cartController.totalValue}',
                      fontWeight: FontWeight.bold,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
