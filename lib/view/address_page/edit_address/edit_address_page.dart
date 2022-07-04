import 'package:flutter/material.dart';
import 'package:menskart/view/address_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: ListView(
        children:const [
          HeadingText(headingText: 'Edit Address'),
          TextandFormFieldWidget(headingText: 'Full Name', hintText: 'Viswajith K A'),
          TextandFormFieldWidget(headingText: 'Mobile Number', hintText: '+91 9447617999'),
          TextandFormFieldWidget(headingText: 'Pin Code', hintText: '682030'),
          TextandFormFieldWidget(headingText: 'Flat,House No,Building Name', hintText: 'House No: 12'),
          TextandFormFieldWidget(headingText: 'Road Name, Area , Colony', hintText: 'Thammadiyill Temple Road'),
          TextandFormFieldWidget(headingText: 'Landmark', hintText: 'Aiswarya Nagar'),
          TextandFormFieldWidget(headingText: 'Town/City', hintText: 'Thripunitura'),
          TextandFormFieldWidget(headingText: 'State', hintText: 'Kerala'),
          TextandFormFieldWidget(headingText: 'Address Type', hintText: 'Home(7am -9pm Delivery)'),
         ConfirmYellowButton(buttonText: 'Save Changes', buttonColor: kYellow,)
        ],
      )),
    );
  }
}
