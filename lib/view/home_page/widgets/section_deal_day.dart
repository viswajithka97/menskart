import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/home_page/home_page_detail_view/home_page_view.dart';
import 'package:menskart/view/home_page/widgets/shimmer_widget.dart';
import 'package:menskart/view/widgets/rating_star_widget.dart';

class DealOfTheDaySection extends StatelessWidget {
  const DealOfTheDaySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Deal of the Day',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (controller) {
            if (controller.products == null) {
              return const ShimmerWidget();
            }
            return Container(
              height: size!.height * 0.33,
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
                        Get.to(() => HomePageView(
                            productId: controller.products![index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: size!.height * 0.33,
                          width: size!.width * 0.382,
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
                                    child: FadeInImage.assetNetwork(
                                        fit: BoxFit.fill,
                                        height: size!.width * 0.382,
                                        width: size!.height * 0.1763,
                                        placeholderFit: BoxFit.scaleDown,
                                        placeholderCacheHeight: 50,
                                        placeholder:
                                            'assets/images/loading.png',
                                        image:
                                            'http://menscart.shop/product-images/${controller.products![index].id}.jpg')

                                    //  Container(

                                    //   decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //       image: NetworkImage(
                                    //          ),
                                    //       fit: BoxFit.cover,
                                    //     ),
                                    //   ),
                                    // ),
                                    ),
                                SizedBox(
                                  height: size!.height * 0.045,
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
                                      '₹ ${controller.products![index].offerPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                        '₹${controller.products![index].orginalPrice}',
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
