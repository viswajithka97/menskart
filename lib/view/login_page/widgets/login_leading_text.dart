import 'package:flutter/cupertino.dart';

class LoginLeadingText extends StatelessWidget {
  final String leadingText;
  
  const LoginLeadingText({
    Key? key, required this.leadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
       padding:const EdgeInsets.symmetric(horizontal: 10.0),
       child: Text(
         leadingText,
         style:const TextStyle(fontSize: 20),
       ),
     );
  }
}