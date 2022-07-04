import 'package:flutter/material.dart';
import 'package:menskart/view/core/color_constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingWidget extends StatelessWidget {
  const OrderTrackingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimelineTile(
            alignment: TimelineAlign.start,
            isFirst: true,
            indicatorStyle:
                const IndicatorStyle(drawGap: true, width: 20, color: Colors.green),
            afterLineStyle: const LineStyle(color: Colors.green, thickness: 6),
            endChild: const Padding(
              padding: EdgeInsets.all(8.0),
              child:  Text(
                'Order Confirmed',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TimelineTile(
              alignment: TimelineAlign.start,
              beforeLineStyle: const LineStyle(
                color: kBackgroundGrey,
                thickness: 3,
              ),
              hasIndicator: false,
              indicatorStyle: const IndicatorStyle(
                padding: EdgeInsets.only(left: 8.5),
                // drawGap: true,
                width: 20,
                color: kBackgroundGrey,
              ),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: kBackgroundGrey,
            ),
            beforeLineStyle: const LineStyle(
              color: kBackgroundGrey,
              thickness: 3,
            ),
            endChild: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Shipped',
                style:  TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TimelineTile(
              alignment: TimelineAlign.start,
              beforeLineStyle: const LineStyle(
                color: kBackgroundGrey,
                thickness: 3,
              ),
              hasIndicator: false,
              indicatorStyle: const IndicatorStyle(
                padding: EdgeInsets.only(left: 8.5),
                // drawGap: true,
                width: 20,
                color: kBackgroundGrey,
              ),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            beforeLineStyle: const LineStyle(
              color: kBackgroundGrey,
              thickness: 3,
            ),
            afterLineStyle: const LineStyle(
              color: kBackgroundGrey,
              thickness: 3,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: kBackgroundGrey,
            ),
            endChild: const Padding(
              padding: EdgeInsets.all(8.0),
              child:  Text(
                'Out for Delivery',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TimelineTile(
              alignment: TimelineAlign.start,
              beforeLineStyle: const LineStyle(
                color: kBackgroundGrey,
                thickness: 3,
              ),
              hasIndicator: false,
              indicatorStyle: const IndicatorStyle(
                padding: EdgeInsets.only(left: 8.5),
                // drawGap: true,
                width: 20,
                color: kBackgroundGrey,
              ),
            ),
          ),
          TimelineTile(
              alignment: TimelineAlign.start,
              isLast: true,
              beforeLineStyle: const LineStyle(
                color: kBackgroundGrey,
                thickness: 3,
              ),
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: kBackgroundGrey,
              ),
              endChild: const Padding(
                padding: EdgeInsets.all(8.0),
                child:  Text(
                  'Delivered',
                  style: TextStyle(fontSize: 18),
                ),
              )),
        ],
      ),
    );
  }
}
