import 'package:flutter/material.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/container_button.dart';

class ProductDetailMiddleSection extends StatelessWidget {
  const ProductDetailMiddleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  SizedBox(
                height: 30,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ))),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetwe,
                children: const [
                  Text(
                    '₹  1640',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                        fontSize: 25),
                  ),
                  kWidth30,
                  Text(
                    '₹3999',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  kWidth30,
                  Text(
                    '53%off.',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),

              kHeight10,
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kBackgroundGrey, borderRadius: kBRadius10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.assignment_return_rounded,
                          color: Colors.orange,
                        ),
                        Text('7-Day Replacement')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.money,
                          color: Colors.green,
                        ),
                        Text('Cash on Delivery')
                      ],
                    )
                  ],
                ),
              ),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerButton(
                    height: 50,
                    width: 150,
                    buttonText: 'Add to Cart',
                    containerIcon: Icons.shopping_cart_outlined,
                    radius: kBRadius10,
                  ),
                  ContainerButton(
                    height: 50,
                    width: 150,
                    buttonText: 'Buy Now',
                    containerIcon: Icons.shopping_cart_outlined,
                    radius: kBRadius10,
                    buttonColor: kGreen,
                  ),
                ],
              )
      ],
    );
  }
}