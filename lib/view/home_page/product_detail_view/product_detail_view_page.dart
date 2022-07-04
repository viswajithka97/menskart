import 'package:flutter/material.dart';
import 'package:menskart/view/home_page/product_detail_view/widgets/product_detail_middle_section.dart';
import 'package:menskart/view/home_page/product_detail_view/widgets/product_detail_top_section.dart';


class ProductDetailViewPage extends StatelessWidget {
  const ProductDetailViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kBlack,
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children:const [
              ProductDetailTopSection(),
            ProductDetailMiddleSection()
            ],
          ),
        )));
  }
}
