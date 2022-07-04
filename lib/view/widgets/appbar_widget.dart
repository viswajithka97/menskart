
import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kAppBarBlue,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: kWhite,
            child: IconButton(
                onPressed: () {},
                icon:const Icon(
                  Icons.search,
                  color: kBlack,
                )),
          ),
        )
      ],
    );
  }
}
