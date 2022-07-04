import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/rating_star_widget.dart';


class ProductDetailTopSection extends StatelessWidget {
  const ProductDetailTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
                'LIGHT TONE WATER COTTON STRETCH RICARDO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              kHeight10,
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: kBRadius10,
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1582552938357-32b906df40cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                      fit: BoxFit.cover),
                ),
              ),
              kHeight10,
              Row(
                children: const [
                  RatingStarWidget(),
                  kWidth10,
                  Text('35 Ratings & 45 Reviews')
                ],
              ),
      ],
    );
  }
}