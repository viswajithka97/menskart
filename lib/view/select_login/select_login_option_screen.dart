import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/select_login/widgets/select_login_option_widget.dart';

class SelectLoginOption extends StatelessWidget {
  const SelectLoginOption ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high)),
      child: const Scaffold(
        backgroundColor: kTransparent,
        body: SafeArea(
          child:SelectLoginOptionWidget(),
        ),
      ),
    );
  }
 
}
