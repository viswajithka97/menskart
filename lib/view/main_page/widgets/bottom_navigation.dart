import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/cart_controller/cart_controller.dart';
import 'package:menskart/view/core/color_constants.dart';

ValueNotifier<int> indexChangedNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangedNotifier,
      builder: (BuildContext context, int newIndex, _) {
        return BottomNavigationBar(
          onTap: (index) => indexChangedNotifier.value = index,
          // type: BottomNavigationBarType.fixed,
          currentIndex: newIndex,
          selectedItemColor: kLoginBlue,
          unselectedItemColor: Colors.grey,
          backgroundColor: kBlack,
          selectedFontSize: 12,

          iconSize: 27,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "WishList",
            ),
            BottomNavigationBarItem(
              icon: Stack(children: [
                const Icon(Icons.shopping_cart_outlined),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: const BoxDecoration(
                      color: kLoginBlue,
                      shape: BoxShape.circle,
                    ),
                    child: GetBuilder<CartController>(
                      init: CartController(),
                      initState: (_) {},
                      builder: (controller) {
                        return Center(
                          child: controller.cartCount == null
                              ? const Text(
                                  "0",
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: 10,
                                  ),
                                )
                              : Text(
                                  controller.cartCount.toString(),
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 10,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                )
              ]),
              label: "Cart",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            ),
          ],
        );
      },
    );
  }
}
