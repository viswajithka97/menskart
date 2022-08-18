import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart/controller/address_controller/address_controller.dart';
import 'package:menskart/view/core/color_constants.dart';

String? selectedvalue;

class DropDownAddressWidget extends StatelessWidget {
  const DropDownAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 45,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kBackgroundGrey,
                ),
              ),
              child: DropdownButton(
                  dropdownColor: kBackgroundGrey,
                  itemHeight: 60,
                  isDense: true,
                  isExpanded: true,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  hint: const Text('Select Address Type'),
                  value: selectedvalue,
                  items: locationSelect
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    selectedvalue = value.toString();
                    controller.update();
                  }),
            ),
          );
        },
      ),
    );
  }
}

final locationSelect = [
  "Home ",
  "Office",
];
