import 'package:flutter/material.dart';
import 'package:menskart/view/account_page/account_screen_page.dart';
import 'package:menskart/view/cart_page/cart_screen.dart';
import 'package:menskart/view/home_page/home_screen.dart';
import 'package:menskart/view/main_page/widgets/bottom_navigation.dart';
import 'package:menskart/view/wishlist_page/wishlist_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _pages = [
    const HomeScreen(),
    const WishListScreen(),
    const CartScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangedNotifier,
          builder: (BuildContext context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
