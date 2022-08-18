import 'package:flutter/material.dart';
import 'package:menskart/main.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        // height: size!.height * 0.60,
        height: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 216, 226, 228),
              highlightColor: Colors.white,
              child: Container(
                width: size!.width * 1.274,
                height: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ]));
  }
}
