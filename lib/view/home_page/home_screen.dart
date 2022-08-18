import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/view/home_page/widgets/categoty_section.dart';
import 'package:menskart/view/home_page/widgets/coupon_section.dart';
import 'package:menskart/view/home_page/widgets/home_carousel.dart';
import 'package:menskart/view/home_page/widgets/section_deal_day.dart';
import 'package:menskart/view/home_page/widgets/section_latest_products.dart';
import 'package:menskart/view/home_page/widgets/shimmer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
         
          if (controller.products == null) {
            return const ShimmerWidget();
          }
          return ListView(
            children: [
              const TopSectionCarousel(),
              const DealOfTheDaySection(),
              CategorySection(),
              const CouponSection(),
              const LatestProductsSection(),
            ],
          );
        },
      )),
    );
  }
}
