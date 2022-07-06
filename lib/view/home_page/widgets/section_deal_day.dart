import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
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
          initState: (_) {},
          builder: (controller) {
            if (controller.products == null) {
              return const SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
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
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 280,
                        width: 150,
                        color: kWhite,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'http://menscart.shop/product-images/${controller.products![index].id}.jpg'),
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
                    );
                  }),
            );
          },
        )
      ],
    );
  }
}
