
import 'package:flutter/cupertino.dart';

class PriceDetails extends StatelessWidget {
  final String priceName;
  final String price;
  final FontWeight? fontWeight;
  const PriceDetails({
    Key? key,
    required this.priceName,
    required this.price,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(priceName, style: TextStyle(fontSize: 18, fontWeight: fontWeight)),
        Text(price, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
