import 'package:flutter/cupertino.dart';


class NormalHeadingText extends StatelessWidget {
  final String normalText;
  const NormalHeadingText({Key? key, required this.normalText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:const EdgeInsets.all(10.0),
      child: Text(
        normalText,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}