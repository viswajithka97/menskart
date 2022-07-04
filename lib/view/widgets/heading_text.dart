
import 'package:flutter/cupertino.dart';

class HeadingText extends StatelessWidget {
  final String headingText;
  const HeadingText({
    
    Key? key, required this.headingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.all(10.0),
      child: Text(
        headingText,
        style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
