import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/cart_controller/cart_controller.dart';
import 'package:menskart/controller/wishlist_controller/wishlist_controller.dart';
import 'package:menskart/model/category_wise_product_model/category_wise_product_model.dart';
import 'package:menskart/view/cart_page/cart_screen.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/container_button.dart';

class ProductDetailMiddleSection extends StatelessWidget {
  final Product category;
  ProductDetailMiddleSection({Key? key, required this.category})
      : super(key: key);
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: GetBuilder<WishlistController>(
            init: WishlistController(),
            builder: (controller) {
              controller.checkWishlist(category.id);
              return Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        controller.addToWishlist(category.id);
                      },
                      icon: controller.isAdded == null
                          ? const CircularProgressIndicator()
                          : controller.isAdded == true
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                  size: 30,
                                )));
            },
          ),
        ),
        Row(
          children: [
            category.offerPrice == null
                ? const Text(
                    '₹ 1640',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                        fontSize: 25),
                  )
                : Text(
                    '₹ ${category.offerPrice}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                        fontSize: 25),
                  ),
            kWidth30,
            Text(
              '₹${category.orginalPrice}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 20,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            kWidth30,
            Text(
              '${category.offerpercentage}%off.',
              style: const TextStyle(
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
          decoration:
              BoxDecoration(color: kBackgroundGrey, borderRadius: kBRadius10),
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
              onPressed: () {
                controller.addToCart(category.id);
              },
            ),
            ContainerButton(
              height: 50,
              width: 150,
              buttonText: 'Buy Now',
              containerIcon: Icons.shopping_cart_outlined,
              radius: kBRadius10,
              buttonColor: kGreen,
              onPressed: () {
                controller.addToCart(category.id);
                Get.to(() => const CartScreen());
              },
            ),
          ],
        )
      ],
    );
  }
}
