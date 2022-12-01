import 'package:e_commerce_app/controllers/popular_product_controller.dart';
import 'package:e_commerce_app/controllers/recommended_product_controller.dart';
import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:e_commerce_app/data/reppository/popular_product_repo.dart';
import 'package:e_commerce_app/data/reppository/recommended_product_repo.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';
Future<void> init()async{
  //AppClient
 Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

 //PopularProductRepo
 Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
 //recommended product repo
 Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));

 //PopularProductController
 Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
 //recommended product controller
 Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo: Get.find()));

}