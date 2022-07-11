import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/category_controller/category_controller.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/core/url_constants.dart';
import 'package:menskart/view/home_page/product_detail_view/product_detail_view_page.dart';
import 'package:menskart/view/widgets/rating_star_widget.dart';

class CategoryResultSection extends StatelessWidget {
  const CategoryResultSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Results',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          kHeight10,
          GetBuilder<CategoryController>(
            init: CategoryController(),
            builder: (controller) {
              if (controller.categoryProduct == null) {
                return const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 8,
                            childAspectRatio: 80 / 180,
                            crossAxisCount: 2),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final category = controller.categoryProduct![index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetailViewPage(
                                productId: category,
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kBackgroundGrey, borderRadius: kBRadius10),
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 230,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '$kProductUrl${category.id}.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                kHeight10,
                                SizedBox(
                                  height: 60,
                                  child: Text(
                                    category.description,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                const RatingStarWidget(),
                                kHeight10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    category.offerPrice == null
                                        ? const Text(
                                            '₹ 1640',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        : Text(
                                            '₹ ${category.offerPrice}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '₹${category.orginalPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 20,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                                kHeight10,
                                Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: kLoginBlue,
                                        borderRadius: kBRadius30),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.snackbar('', 'Added to Cart');
                                      },
                                      child: const Text(
                                        "Add to Cart",
                                        style: TextStyle(color: kWhite),
                                      ),
                                    ))
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
      ),
    );
  }
}
