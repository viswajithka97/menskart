import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/view/core/border_radius.dart';

class TopSectionCarousel extends StatelessWidget {
  const TopSectionCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<HomePageController>(
          init: HomePageController(),
          initState: (_) {},
          builder: (controller) {
            if (controller.banner == null) {
              return const SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: kBRadius10,
              ),
              width: double.infinity,
              height: 200,
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,

                    autoPlay: true,
                    // aspectRatio: 3.0/2.0,
                    // autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    // enableInfiniteScroll: true,

                    // autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    viewportFraction: 1,
                  ),
                  itemCount: controller.banner!.length,
                  itemBuilder: (context, itemindex, pageViewIndex) {
                    return Container(
                      width: double.infinity,
                      // height: 300,
                      decoration: BoxDecoration(
                        borderRadius: kBRadius10,
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://menscart.shop/banner-images/${controller.banner![itemindex].id}.jpg'),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                            alignment: Alignment.center),
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
