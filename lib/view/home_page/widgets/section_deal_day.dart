import 'package:flutter/material.dart';
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
        Container(
          height: 280,
          width: double.infinity,
          color: kBackgroundGrey,
          alignment: Alignment.centerLeft,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
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
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://assets.ajio.com/medias/sys_master/root/20210403/ywxs/60686961f997dd7b645dbf0c/-473Wx593H-461119026-black-MODEL.jpg'))),
                            ),
                          ),
                          const Text(
                            'SOLID COTTON REGULAR FIT MENS T-SHIRT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const RatingStarWidget(),
                          kHeight10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                '₹ 1640',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text('₹3999',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
