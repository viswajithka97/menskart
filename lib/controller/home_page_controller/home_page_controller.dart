import 'dart:developer';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_services/home_page_api_services.dart';
import 'package:menskart/model/home_page/all_coupon_model.dart';
import 'package:menskart/model/home_page/home_page_model.dart';

class HomePageController extends GetxController {
  List<Product>? products;
  List<Banner>? banner;
  List<Category>? category;
  List<TrendingProduct>? trendingProducts;
  List<Coupon>? coupons;

  getData() async {
    try {
      final response = await HomePageApiServices().getAllData();

      if (response!.data != null) {
        final received = homePageModelFromJson(response.data);

        products = received.products.obs;
        banner = received.banner.obs;
        category = received.category.obs;
        trendingProducts = received.trendingProducts.obs;
        log(category!.length.toString());
        update();
      } else {
        log('data vannatila');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  getAllCoupons() async {
    try {
      final response = await HomePageApiServices().getAllCoupons();

      log(response!.data.toString());
      if (response.statusCode == 200) {
        final data = allCouponModleFromJson(response.data);
        coupons = data.coupon.obs;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getData();
    getAllCoupons();
    super.onInit();
  }
}
