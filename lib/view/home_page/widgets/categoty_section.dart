import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/category_controller/category_controller.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';

class CategorySection extends StatelessWidget {
  CategorySection({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight20,
        GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (controller) {
            if (controller.category == null) {
              return SizedBox(
                height: size!.height * .236,
                width: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              height: size!.height * .294,
              width: double.infinity,
              color: kBackgroundGrey,
              child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        categoryController.getCategory(
                            controller.category![index].category.toString());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                'https://menscart.shop/category-image/${controller.category![index].id}.jpg'),
                          ),
                          Text(
                            controller.category![index].category.toString(),
                            style: const TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => kWidth20,
                  itemCount: controller.category!.length),
            );
          },
        )
      ],
    );
  }
}
