import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/splash_screen/widgets/splash_screen_widget.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

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
          child: SplashScreenWidget(),
        ),
      ),
    );
  }
}
