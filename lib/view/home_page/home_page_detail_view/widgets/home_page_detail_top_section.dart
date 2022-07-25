import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menskart/model/home_page/home_page_model.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/core/url_constants.dart';
import 'package:menskart/view/widgets/rating_star_widget.dart';

class HomePageTopSection extends StatelessWidget {
  final Product category;
  const HomePageTopSection({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.description.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        kHeight10,
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: kBRadius10,
            image: DecorationImage(
                image: NetworkImage('$kProductUrl${category.id}.jpg'),
                filterQuality: FilterQuality.high,
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
