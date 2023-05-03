import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/Cart_Controller.dart';
import 'package:food_delivery_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_delivery_ecommerce/pages/Cart/cart_page.dart';
import 'package:food_delivery_ecommerce/pages/home/main_food_page.dart';
import 'package:food_delivery_ecommerce/routes/routes_helper.dart';
import 'package:food_delivery_ecommerce/utils/app_constants.dart';
import 'package:food_delivery_ecommerce/utils/colors.dart';
import 'package:food_delivery_ecommerce/utils/dimensions.dart';
import 'package:food_delivery_ecommerce/widgets/Big_Text.dart';
import 'package:food_delivery_ecommerce/widgets/app_column.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/expandable_text_widget.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';
import 'package:food_delivery_ecommerce/widgets/text_icon_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        body: Stack(
          children: [
            //background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImgSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!),
                  )),
                )),
            //icon widget
            Positioned(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (() {
                          if (page == "cartpage") {
                            Get.toNamed(RouteHelper.getCartPage());
                          } else {
                            Get.toNamed(RouteHelper.getInitial());
                          }
                        }),
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    GetBuilder<PopularProductController>(
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            if (controller.totalItems >= 1)
                              Get.toNamed(RouteHelper.getCartPage());
                          },
                          child: Stack(
                            children: [
                              AppIcon(
                                  icon: Icons.shopping_cart_checkout_outlined),
                              controller.totalItems >= 1
                                  ? Positioned(
                                      right: 0,
                                      top: 0,
                                      child: AppIcon(
                                        icon: Icons.circle,
                                        size: 20,
                                        iconColor: Colors.transparent,
                                        backgroundColor: AppColors.mainColor,
                                      ),
                                    )
                                  : Container(),
                              Get.find<PopularProductController>().totalItems >=
                                      1
                                  ? Positioned(
                                      right: 3,
                                      top: 3,
                                      child: BigText(
                                        text:
                                            Get.find<PopularProductController>()
                                                .totalItems
                                                .toString(),
                                        size: 12,
                                        color: Colors.white,
                                      ))
                                  : Container()
                            ],
                          ),
                        );
                      },
                    )
                  ],
                )),
            //introduction of food
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize - 20,
                child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            topLeft: Radius.circular(Dimensions.radius20)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(text: product.name!),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        BigText(text: "Introduce"),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: product.description!),
                          ),
                        )
                      ],
                    )))
            //exbandable text widget
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(
                          text: popularProduct.inCartItems.toString(),
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height15,
                          bottom: Dimensions.height15,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                      child: BigText(
                        text: "\$ ${product.price!} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
