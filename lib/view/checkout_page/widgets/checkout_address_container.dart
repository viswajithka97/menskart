import 'package:flutter/material.dart';
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
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kBackgroundGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: visibility,
                          child: GestureDetector(
                              onTap: () {}, child: const Icon(Icons.delete)),
                        ),
                      ],
                    ),
                    const Text(
                      'Viswajith K A\nHouse No: 12\nAiswarya Nagar \nThammadiyill Temple Road\nThripunitura\nKerala - 682301',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '+91 9447617999',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        // SizedBox(
                        //   height: 40,
                        //   width: 80,
                        //   child: ConfirmYellowButton(
                        //       buttonText: 'Edit',
                        //       buttonColor: kConButonColor,
                        //       onPressed: EditAddress()),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
