import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/address_controller/address_controller.dart';
import 'package:menskart/controller/location_controller/location_controller.dart';
import 'package:menskart/view/address_page/add_address/widgets/location_fetch.dart';
import 'package:menskart/view/address_page/widgets/drop_down_widget.dart';

import 'package:menskart/view/address_page/widgets/text_and_form_field_widget.dart';
import 'package:menskart/view/cart_page/widgets/confirm_yellow_button.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
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
          final houseNoController = TextEditingController();
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
                    headingText: 'Flat No.,House No,Building No.',
                    controller: houseNoController,
                    hintText: 'Enter your House No,Building No.,Flat No.'),
                TextandFormFieldWidget(
                    headingText: 'Address',
                    controller: addressController,
                    hintText: 'Enter your Address'),
                TextandFormFieldWidget(
                    controller: cityController,
                    headingText: 'Road Name, Area , Colony',
                    hintText: 'Enter yourRoad Name, Area , Colony'),
                TextandFormFieldWidget(
                    controller: stateController,
                    headingText: 'State',
                    hintText: 'Select the State'),
                kHeight10,
                const DropDownAddressWidget(),
                GetBuilder<AddressController>(
                  init: AddressController(),
                  initState: (_) {},
                  builder: (addController) {
                    return ConfirmYellowButton(
                      buttonText: 'Add New Address',
                      buttonColor: kYellow,
                      onPressed: () {
                        final name = nameController.text;
                        final phoneNumber = phoneController.text;
                        final state = stateController.text;
                        final address = addressController.text;
                        final pincode = pincodeController.text;
                        final city = cityController.text;
                        final houseNo = houseNoController.text;
                        final addressType = selectedvalue.toString();
                        addController.addAddress(
                            name,
                            phoneNumber,
                            state,
                            pincode,
                            city,
                            int.parse(houseNo),
                            address,
                            addressType);
                        Get.back();
                      },
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
