import 'package:flutter/material.dart';
import 'package:menskart/model/home_page/home_page_model.dart';
import 'package:menskart/view/home_page/home_page_detail_view/widgets/home_page_detail_bottom_section.dart';
import 'package:menskart/view/home_page/home_page_detail_view/widgets/home_page_detail_top_section.dart';

class HomePageView extends StatelessWidget {
  final Product productId;
  const HomePageView({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kBlack,
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              HomePageTopSection(category: productId),
              HomePageBottomSection(category: productId)
            ],
          ),
        )));
  }
}
