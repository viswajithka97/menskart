import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: double.infinity,
      color: kBackgroundGrey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit)),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png'),
          ),
          const SizedBox(height: 20),
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            '+91-9447617999',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'viswajithka97@gmail.com',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

