import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menskart/controller/address_controller/address_controller.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/view/address_page/edit_address/edit_address_page.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/core/color_constants.dart';

class CheckoutAddressSelect extends StatelessWidget {
  final bool visibility;
  const CheckoutAddressSelect({
    Key? key,
    this.visibility = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) {
        if (controller.address == null) {
          return Center(
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Lottie.asset("assets/lottie/loading.json"),
            ),
          );
        } else {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.address!.length,
              itemBuilder: (context, index) {
                final address = controller.address![index].address;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GetBuilder<PlaceOrderController>(
                    init: PlaceOrderController(),
                    builder: (placeOrder) {
                      return GestureDetector(
                        onTap: () {
                          placeOrder.containerColorChange(index, address);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: placeOrder.selectIndex == index
                                ? const Color.fromARGB(255, 208, 241, 209)
                                : kBackgroundGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      address.home,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Visibility(
                                      visible: visibility,
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.defaultDialog(
                                                title: 'Delete Address',
                                                content: const Text(
                                                    'Are you sure you want to delete this address?'),
                                                onConfirm: () {
                                                  controller.deleteAddress(
                                                      address.useraddress);
                                                  Get.back();
                                                },
                                                onCancel: () {
                                                  Get.back();
                                                });
                                          },
                                          child: const Icon(Icons.delete)),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${address.name}\nHouse No: ${address.house}\n${address.address} \n${address.city}\n${address.state} - ${address.pincode}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '+91 ${address.phoneNumber}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 80,
                                      child: ConfirmYellowButton(
                                          buttonText: 'Edit',
                                          buttonColor: kConButonColor,
                                          onPressed: () {
                                            Get.to(EditAddress(
                                              address: address,
                                            ));
                                          }),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              });
        }
      },
    );
  }
}
