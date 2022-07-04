import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/home_page/category_select_page/category_select_page.dart';

class CategorySection extends StatelessWidget {
   CategorySection({Key? key}) : super(key: key);

 final images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RjJsYfTRucnqZf__pqhp7ClgDUtHjR6mEQ&usqp=CAU',
    'https://4.imimg.com/data4/EH/NN/MY-17368652/boys-casual-shirt-500x500.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJGGzaC6BdDD9dR1FSM0dFPnMXjQKSHzaQkw&usqp=CAU',
    'https://cdn.shopify.com/s/files/1/0752/6435/products/SATURNRINGTSHIRTBLACK_24.jpg?v=1645852396',
  ];

    final names = ['Jeans', 'Shirts', 'Shoes', 'T-Shirt'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          kHeight20,
          Container(
            height: 250,
            width: double.infinity,
            color: kBackgroundGrey,
            child: ListView.separated(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(const CategorySelect());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(images[index]),
                        ),
                        Text(
                          names[index],
                          style: const TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                itemCount: 4),
          )
      ],
    );
  }
}