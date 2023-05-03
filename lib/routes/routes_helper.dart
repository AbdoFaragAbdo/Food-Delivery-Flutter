import 'package:food_delivery_ecommerce/pages/Cart/cart_page.dart';
import 'package:food_delivery_ecommerce/pages/Splash/splash_page.dart';
import 'package:food_delivery_ecommerce/pages/auth/sign_in_page.dart';
import 'package:food_delivery_ecommerce/pages/auth/sign_up_page.dart';
import 'package:food_delivery_ecommerce/pages/food/popular_food_detail.dart';
import 'package:food_delivery_ecommerce/pages/food/recommend_food_detail.dart';
import 'package:food_delivery_ecommerce/pages/home/home_page.dart';
import 'package:food_delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signin = "/sign-in";
  static const String signup = "/sign-up";

  static String getSignup() => '$signup';
  static String getSignin() => '$signin';

  static String getSplashPage() => '$splashPage';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getInitial() => '$initial';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: signin, page: () => SignInPage()),
    GetPage(name: signup, page: () => SignUpPage()),
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];

          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
