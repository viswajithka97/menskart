import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/main.dart';
import 'package:menskart/view/core/space_constants.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight20,
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'You Have Unlocked',
                      style: TextStyle(fontSize: 15),
                    ),
                    content: const Text(
                      'Coupon Code',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Copy Code'))
                    ],
                  );
                });
          },
          child: Container(
            height: size!.height * 0.212,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/coupon.jpg'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover),
            ),
          ),
        )
      ],
    );
  }
}
