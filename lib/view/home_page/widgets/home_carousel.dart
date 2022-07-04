import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';

class TopSectionCarousel extends StatelessWidget {
  TopSectionCarousel({
    Key? key,
  }) : super(key: key);

  final images = [
    'https://www.rei.com/dam/content_team_010818_52427_htc_running_shoes_hero2_lg.jpg',
    'https://assets.ajio.com/medias/sys_master/root/20210403/ywxs/60686961f997dd7b645dbf0c/-473Wx593H-461119026-black-MODEL.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: kBRadius10, color: kBackgroundGrey),
        width: double.infinity,
        height: 300,
        child: CarouselSlider(
          items: [
            Container(
              width: double.infinity,
              // height: 300,

              decoration: BoxDecoration(
                borderRadius: kBRadius10,
                image: DecorationImage(
                  image: NetworkImage(images[0]),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover
                  
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[1]),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 300.0,
            enlargeCenterPage: true,

            autoPlay: true,
            aspectRatio: 3.0,
            // autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            // enableInfiniteScroll: true,

            // autoPlayAnimationDuration: const Duration(milliseconds: 500),
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}
