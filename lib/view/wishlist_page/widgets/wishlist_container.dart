import 'package:flutter/material.dart';
import 'package:menskart/view/core/border_radius.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:menskart/view/core/space_constants.dart';
import 'package:menskart/view/widgets/container_button.dart';

class WishlistContainer extends StatelessWidget {
  const WishlistContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration:
                BoxDecoration(borderRadius: kBRadius15, color: kConBagColor),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: kBRadius10,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.rei.com/dam/content_team_010818_52427_htc_running_shoes_hero2_lg.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 150,
                    width: 210,
                    // color: kBlack,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mens Regular Lace Up mens Sports Shoes',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        kHeight5,
                        const Text(
                          '₹ 2,240',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        kHeight5,
                        const Text(
                          'In Stock',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green),
                        ),
                        kHeight5,
                        Row(
                          children: [
                             ContainerButton(
                                height: 38,
                                width: 100,
                                containerIcon: Icons.fast_forward_rounded,
                                radius: kBRadius30,
                                buttonText: 'But Now'),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 182, 120, 117),
                                  size: 24,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
