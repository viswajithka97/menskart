import 'package:flutter/cupertino.dart';
import 'package:menskart/model/order_model/order_details.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';

class OrderContainer extends StatelessWidget {
  final List<ProductElement>? product;
  const OrderContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = product![0].product;
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: kBRadius15, color: kConBagColor),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: kBRadius10,
                image: DecorationImage(
                    image: NetworkImage(
                        'http://menscart.shop/product-images/${products!.id}.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 150,
              width: 210,
              // color: kBlack,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.description!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  kHeight10,
                  Text(
                    'Qty : ${product![0].quantity}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
