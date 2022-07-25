import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/home_page/home_page_detail_view/home_page_view.dart';
import 'package:menskart/view/widgets/rating_star_widget.dart';
import 'package:shimmer/shimmer.dart';

class LatestProductsSection extends StatelessWidget {
  const LatestProductsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Latest Products ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (controller) {
            if (controller.products == null) {
              return SizedBox(
                  width: double.infinity,
                  height: 280.0,
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 216, 226, 228),
                        highlightColor: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150.0,
                              height: 280.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]));
            }
            return Container(
              height: 280,
              width: double.infinity,
              color: kBackgroundGrey,
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.products!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Get.to(() => HomePageView(
                        //     productId: controller.l![index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 280,
                          width: 150,
                          color: kWhite,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'http://menscart.shop/product-images/${controller.trendingProducts![index].id}.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 38,
                                  child: Text(
                                    controller.products![index].description
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const RatingStarWidget(),
                                kHeight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '₹ ${controller.trendingProducts![index].offerPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                        '₹${controller.trendingProducts![index].orginalPrice}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 20,
                                            decoration:
                                                TextDecoration.lineThrough))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          },
        )
      ],
    );
  }
}
