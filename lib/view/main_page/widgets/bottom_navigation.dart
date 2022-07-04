import 'package:flutter/material.dart';
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "WishList",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            ),
          ],
        );
      },
    );
  }
}
