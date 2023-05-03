import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/Cart_Controller.dart';
import 'package:food_delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_delivery_ecommerce/pages/Cart/cart_page.dart';
import 'package:food_delivery_ecommerce/pages/Splash/splash_page.dart';
import 'package:food_delivery_ecommerce/pages/food/popular_food_detail.dart';
import 'package:food_delivery_ecommerce/pages/food/recommend_food_detail.dart';
import 'package:food_delivery_ecommerce/pages/home/food_page_body.dart';
import 'package:food_delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:food_delivery_ecommerce/routes/routes_helper.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          title: 'FLutter Demo',
          debugShowCheckedModeBanner: false,
          //home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
