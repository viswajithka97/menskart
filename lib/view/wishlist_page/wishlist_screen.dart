// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:menskart/view/widgets/heading_text.dart';
import 'package:menskart/view/wishlist_page/widgets/wishlist_container.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const    HeadingText(
              headingText: 'My Wishlist',
            ),
            // kHeight10,
            Expanded(
              child: WishlistContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
