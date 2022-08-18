import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/authentication_controller/authentication_controller.dart';
import 'package:menskart/view/core/color_constants.dart';

class AccountBottomSection extends StatelessWidget {
  AccountBottomSection({Key? key}) : super(key: key);
  final authController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.info,
            color: kBlack,
          ),
          title: const Text(
            'About',
            style: TextStyle(color: kBlack),
          ),
          onTap: () {
            showAboutDialog(
                context: context,
                applicationName: "Menscart",
                applicationVersion: "1.0.0",
                children: [
                  const Text(
                    "Menscart is an E-commerce App Developed by Viswajith K A",
                    style: TextStyle(fontSize: 15),
                  ),
                ]);
          },
        ),
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
    );
  }
}
