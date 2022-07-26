import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menskart/view/splash_screen/splash_screen.dart';

const String loginKey = '';
Size? size;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
