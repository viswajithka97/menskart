import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/cart_controller/cart_controller.dart';
import 'package:menskart/controller/wishlist_controller/wishlist_controller.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/core/url_constants.dart';
import 'package:menskart/view/home_page/widgets/shimmer_widget.dart';
import 'package:menskart/view/widgets/container_button.dart';

class WishlistContainer extends StatelessWidget {
  WishlistContainer({
    Key? key,
  }) : super(key: key);
  final cont = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      init: WishlistController(),
      builder: (controller) {
        if (controller.wishlist == null) {
          return const ShimmerWidget();
        } else if (controller.wishlistcount == 0) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: Text(
                'No items in wishlist',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        return ListView.builder(
            itemCount: controller.wishlist!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              //  print(size!.width * 0.535);
              final item = controller.wishlist![index];

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size!.height * 0.1763,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: kBRadius15, color: kConBagColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: size!.height * 0.1646,
                              width: size!.width * 0.357,
                              decoration: BoxDecoration(
                                  borderRadius: kBRadius10,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '$kProductUrl${item.product!.id}.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: SizedBox(
                              height: size!.height * 1763,
                              width: size!.width * 0.535,
                              // color: kBlack,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product!.description!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  kHeight5,
                                  item.product!.offerPrice == null
                                      ? Text(
                                          '₹ ${item.product!.orginalPrice}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      : Text(
                                          '₹ ${item.product!.offerPrice}',
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
                                    children: [
                                      ContainerButton(
                                          height: size!.height * 0.045,
                                          width: size!.width * 0.255,
                                          containerIcon:
                                              Icons.fast_forward_rounded,
                                          radius: kBRadius30,
                                          onPressed: () {
                                            cont.addToCart(item.product!.id!);
                                          },
                                          buttonText: 'But Now'),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                title: 'Remove from wishlist',
                                                content: const Text(
                                                    'Are you sure you want to remove this item from wishlist?'),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child:
                                                          const Text('Cancel')),
                                                  kWidth20,
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        controller
                                                            .deleteFromWishlist(
                                                                item.product!
                                                                    .id!);
                                                        controller.update();
                                                        controller
                                                            .getWishlist();
                                                        controller.update();
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                          'Confirm')),
                                                ]);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                                255, 182, 120, 117),
                                            size: 24,
                                          ))
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
      },
    );
  }
}
