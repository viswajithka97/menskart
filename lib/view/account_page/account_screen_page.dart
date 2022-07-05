import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/authentication_controller/authentication_controller.dart';
import 'package:menskart/view/account_page/widgets/account_center_section.dart';
import 'package:menskart/view/account_page/widgets/user_details_container.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const HeadingText(headingText: 'My Profile'),
          const UserDetailsContainer(),
          kHeight10,
          const AccountCenterSection(),
          kHeight10,
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: kBlack,
            ),
            title: const Text('Logout'),
            onTap: () {
              authController.logout();
            },
          )
        ],
      ),
    ));
  }
}
