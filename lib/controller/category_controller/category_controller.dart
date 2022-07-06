import 'dart:developer';

import 'package:get/get.dart';
import 'package:menskart/controller/category_controller/category_api_services/category_api_services.dart';
import 'package:menskart/model/category_wise_product_model/category_wise_product_model.dart';
import 'package:menskart/view/home_page/category_select_page/category_select_page.dart';

class CategoryController extends GetxController{
  List<Product>? categoryProduct;

  
  Future<Response<dynamic>?> getCategory(String category) async {
    try {
      final response = await CategoryApiServices().getCategoryData(category);

      if (response!.data != null) {
        print('not null');
        final recieved = categoryWiseProductModelFromJson(response.data);
        print('data convert aayi');
        categoryProduct = recieved.products.obs;

        Get.to(() => const CategorySelect());

        update();
      } else {
        log('data vannatila');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}