import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_widget.dart';
import 'package:menskart/view/main_page/main_page.dart';
import 'package:menskart/view/main_page/widgets/bottom_navigation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  late Razorpay razorpay;
  final controller = Get.put(PlaceOrderController());
  @override
  void onInit() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    super.onInit();
  }

  void openCheckout() async {

    var options = {
      'key': 'rzp_test_SaEo53N8HkIN5i',
      'amount': int.parse(totalPrice.toString()) * 100,
      'name': 'Menscart.',
      'description': 'Products',
      'timeout': 60,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    controller.placeOrder();
    showGeneralDialog(
      context: Get.context!,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 1500),
      pageBuilder: (_, __, ___) {
        return Center(
          child: GestureDetector(
            onTap: () {
              indexChangedNotifier.value = 0;
              Get.offAll(MainPage());
            },
            child: Container(
              height: 240,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: SizedBox.expand(
                  child:
                      Lottie.asset('assets/lottie/104369-check-motion.json')),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
  
  }

  void _handleExternalWallet(ExternalWalletResponse response) {

  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }
}
