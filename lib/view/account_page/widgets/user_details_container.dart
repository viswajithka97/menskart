import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menskart/controller/user_controller/user_controller.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          if (controller.address == null) {
            return SizedBox(
              height: size!.height * 0.471,
              width: double.infinity,
              child: Lottie.asset("assets/lottie/loading.json"),
            );
          } else if (controller.address!.isEmpty) {
            return SizedBox(
              height: size!.height * 0.265,
              width: double.infinity,
              child: const Center(child: Text("No User Data Found")),
            );
          }
          final address = controller.address![0];
          return Container(
            height: size!.height * 0.265,
            width: double.infinity,
            color: kBackgroundGrey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    kHeight20,
                  ],
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  address.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '+91-${address.phoneNumber}',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  address.email,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        });
  }
}
