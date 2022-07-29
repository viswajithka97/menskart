import 'package:get/get.dart';
import 'package:menskart/controller/place_order_controller/place_order_controller.dart';
import 'package:menskart/view/checkout_page/widgets/price_details_widget.dart';
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
    print('openCheckout');
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
    print('Payment Success');
    controller.placeOrder();
    
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error');
    print(response.code.toString());
    print(response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet');
    print(response.walletName);
  }

  @override
  void onClose() {
    razorpay.clear();
    super.onClose();
  }
}
