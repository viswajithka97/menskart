import 'dart:developer';
import 'package:get/get.dart';
import 'package:menskart/controller/home_page_controller/home_page_services/home_page_api_services.dart';
import 'package:menskart/model/home_page/home_page_model.dart';

class HomePageController extends GetxController {
  List<Product>? products;
  List<Banner>? banner;
  List<Category>? category;
  List<TrendingProduct>? trendingProducts;

  Future<List<HomePageModel>?> getData() async {
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

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
