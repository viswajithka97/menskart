import 'package:flutter/material.dart';
import 'package:menskart/view/home_page/widgets/categoty_section.dart';
import 'package:menskart/view/home_page/widgets/coupon_section.dart';
import 'package:menskart/view/home_page/widgets/home_carousel.dart';
import 'package:menskart/view/home_page/widgets/section_deal_day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          TopSectionCarousel(),
          const DealOfTheDaySection(),
          CategorySection(),
          const CouponSection(),
          const DealOfTheDaySection(),
        ],
      )),
    );
  }
}
