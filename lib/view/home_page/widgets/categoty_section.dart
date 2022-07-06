import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/category_controller/category_controller.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';

class CategorySection extends StatelessWidget {
  CategorySection({Key? key}) : super(key: key);

  final images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RjJsYfTRucnqZf__pqhp7ClgDUtHjR6mEQ&usqp=CAU',
    'https://4.imimg.com/data4/EH/NN/MY-17368652/boys-casual-shirt-500x500.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJGGzaC6BdDD9dR1FSM0dFPnMXjQKSHzaQkw&usqp=CAU',
    'https://cdn.shopify.com/s/files/1/0752/6435/products/SATURNRINGTSHIRTBLACK_24.jpg?v=1645852396',
  ];

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
              return const SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              height: 250,
              width: double.infinity,
              color: kBackgroundGrey,
              child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        categoryController
                            .getCategory(controller.category![index].category);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                'https://menscart.shop/category-image/${controller.category![index].id}.jpg'),
                          ),
                          Text(
                            controller.category![index].category,
                            style: const TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: controller.category!.length),
            );
          },
        )
      ],
    );
  }
}
