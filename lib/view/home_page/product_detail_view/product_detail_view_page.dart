import 'package:flutter/material.dart';
import 'package:menskart/model/category_wise_product_model/category_wise_product_model.dart';
import 'package:menskart/view/home_page/product_detail_view/widgets/product_detail_middle_section.dart';
import 'package:menskart/view/home_page/product_detail_view/widgets/product_detail_top_section.dart';

class ProductDetailViewPage extends StatelessWidget {
  final Product productId;
  const ProductDetailViewPage({Key? key, required this.productId})
      : super(key: key);

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
              ProductDetailTopSection(category: productId),
              ProductDetailMiddleSection(category: productId)
            ],
          ),
        )));
  }
}
