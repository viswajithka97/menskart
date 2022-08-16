// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/cart_controller/cart_controller.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/core/url_constants.dart';
import 'package:menskart/view/widgets/container_button.dart';

class OrdersContainer extends StatelessWidget {
  const OrdersContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(size!.height * .039);
    return GetBuilder<CartController>(
      init: CartController(),
      
      builder: (controller) {
        // controller.getCartItems();
        print("villlichu");
        if (controller.products == null) {
          return SizedBox(
            height: size!.height * .236,
            width: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (controller.products!.isEmpty) {
          return SizedBox(
            height: size!.height * .236,
            width: double.infinity,
            child: const Center(
              child: const Text('No items in Cart,\nPlease Add Some Items'),
            ),
          );
        } else {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.products!.length,
              itemBuilder: (context, index) {
                final product = controller.products![index].product;

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size!.height * .1736,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: kBRadius15, color: kConBagColor),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: size!.height * .1646,
                                width: size!.width * .357,
                                decoration: BoxDecoration(
                                    borderRadius: kBRadius10,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '$kProductUrl${product.id}.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                height: size!.height * .1763,
                                width: size!.height * .247,
                                // color: kBlack,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    kHeight5,
                                    product.offerPrice == null
                                        ? Text('₹ ${product.orginalPrice}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))
                                        : Text(
                                            '₹ ${product.offerPrice}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                    kHeight5,
                                    const Text(
                                      'In Stock',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.green),
                                    ),
                                    kHeight5,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                int count = -1;
                                                controller.productQuantity(
                                                    product.id,
                                                    controller
                                                        .products![index].id,
                                                    count,
                                                    controller.products![index]
                                                        .quantity);
                                              },
                                              icon: const Icon(
                                                  Icons.remove_circle_outline),
                                            ),
                                            Text(
                                              controller
                                                  .products![index].quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                int count = 1;
                                                controller.productQuantity(
                                                    product.id,
                                                    controller
                                                        .products![index].id,
                                                    count,
                                                    controller.products![index]
                                                        .quantity);
                                              },
                                              icon: const Icon(Icons
                                                  .add_circle_outline_rounded),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: ContainerButton(
                                              height: size!.height * .039,
                                              width: size!.width * .204,
                                              containerIcon: Icons.delete,
                                              iconStyle: 15,
                                              radius: kBRadius30,
                                              onPressed: () {
                                                Get.defaultDialog(
                                                  title: 'Delete Item',
                                                  content: const Text(
                                                      'Are you sure you want to delete this item?'),
                                                  confirm: TextButton(
                                                    onPressed: () {
                                                      controller
                                                          .deleteProductFromCart(
                                                              product.id,
                                                              controller
                                                                  .products![
                                                                      index]
                                                                  .id);

                                                      // controller.update();
                                                      controller.getCartItems();
                                                      // controller.update();

                                                      Get.back();
                                                    },
                                                    child: const Text('Yes'),
                                                  ),
                                                  cancel: TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text('No'),
                                                  ),
                                                );
                                              },
                                              buttonText: 'Delete'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}
