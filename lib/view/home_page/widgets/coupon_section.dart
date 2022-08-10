import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_controller.dart';
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
                    content: GetBuilder<HomePageController>(
                      init: HomePageController(),
                      builder: (controller) {
                        if (controller.coupons == null) {
                          return const SizedBox(
                            height: 150,
                            width: 500,
                            child: Center(
                                child:
                                    Center(child: CircularProgressIndicator())),
                          );
                        }
                        return SizedBox(
                          height: 150,
                          width: 500,
                          child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text:
                                            controller.coupons![index].coupon));

                                    Get.back();
                                    Get.snackbar('Copied', 'Coupon Copied');
                                  },
                                  title: Text(
                                    controller.coupons![index].coupon,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  trailing: Text(
                                      "${controller.coupons![index].discount} % off"),
                                );
                              }),
                        );
                      },
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
