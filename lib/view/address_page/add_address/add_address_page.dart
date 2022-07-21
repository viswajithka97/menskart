import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/location_controller/location_controller.dart';
import 'package:menskart/view/address_page/add_address/widgets/location_fetch.dart';

import 'package:menskart/view/address_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/widgets/heading_text.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          final nameController = TextEditingController();
          final phoneController = TextEditingController();
          final addressController =
              TextEditingController(text: controller.locatlityName);
          final pincodeController =
              TextEditingController(text: controller.pincode);
          final cityController = TextEditingController(text: controller.street);
          final stateController = TextEditingController(text: controller.state);
          return Scaffold(
            appBar: AppBar(),
            body: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadingText(headingText: 'Add Address'),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(() => const LocationFetch());
                        },
                        child: const Icon(Icons.location_on_outlined))
                  ],
                ),

                TextandFormFieldWidget(
                  headingText: 'Full Name',
                  hintText: 'Enter your Name',
                  controller: nameController,
                ),
                TextandFormFieldWidget(
                  headingText: 'Mobile Number',
                  hintText: 'Enter your Mobile Number',
                  controller: phoneController,
                ),
                TextandFormFieldWidget(
                  headingText: 'Pin Code',
                  hintText: 'Enter your Pincode',
                  controller: pincodeController,
                ),
                TextandFormFieldWidget(
                    headingText: 'Flat,House No,Building Name',
                    controller: addressController,
                    hintText: 'Enter your House No,Building Name,Flat'),
                TextandFormFieldWidget(
                    controller: cityController,
                    headingText: 'Road Name, Area , Colony',
                    hintText: 'Enter yourRoad Name, Area , Colony'),

                TextandFormFieldWidget(
                    controller: stateController,
                    headingText: 'State',
                    hintText: 'Select the State'),
                // TextandFormFieldWidget(
                //     headingText: 'Address Type',
                //     hintText: 'Select your Address Type'),
                const ConfirmYellowButton(
                    buttonText: 'Add New Address', buttonColor: kYellow),
              ],
            ),
          );
          
        });
  }
}
