
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/view/account_page/order_page/order_details_page/order_details_page.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';

class OrderPageContainer extends StatelessWidget {
  const OrderPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(const OrderDetailsPage());
      },
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: kBRadius15, color: kConBagColor),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: kBRadius10,
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.rei.com/dam/content_team_010818_52427_htc_running_shoes_hero2_lg.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: 150,
                        width: 210,
                        // color: kBlack,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Mens Regular Lace Up mens Sports Shoes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            kHeight10,
                            Text(
                              'Dispatched',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.green),
                            ),
                            kHeight10,
                            Text('Expect Delivery On June 29th')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
