import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/home_page/category_select_page/category_result_section.dart';

class CategorySelect extends StatelessWidget {
  const CategorySelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Scaffold(
        backgroundColor: kTransparent,
        appBar: AppBar(),
        body: const CategoryResultSection(),
      ),
    );
  }
}
