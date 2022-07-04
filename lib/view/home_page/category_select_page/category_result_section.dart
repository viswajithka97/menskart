import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
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
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(const ProductDetailViewPage());
              },
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 8,
                      childAspectRatio: 80 / 180,
                      crossAxisCount: 2),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
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
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1582552938357-32b906df40cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'))),
                            ),
                            kHeight10,
                            const Text(
                              'LIGHT TONE WATER COTTON STRETCH RICARDO',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            const RatingStarWidget(),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '₹ 1640',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '₹3999',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            kHeight10,
                            Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: kLoginBlue, borderRadius: kBRadius30),
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
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
