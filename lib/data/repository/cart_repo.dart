import 'dart:convert';

import 'package:food_delivery_ecommerce/models/cart_model.dart';
import 'package:food_delivery_ecommerce/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.Cart_List);
    sharedPreferences.remove(AppConstants.Cart_History_List);

    var time = DateTime.now().toString();
    cart = [];
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element.tojson()));
    });
    sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    // print(sharedPreferences.getStringList(AppConstants.Cart_List));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.Cart_List)) {
      carts = sharedPreferences.getStringList(AppConstants.Cart_List)!;
      print("inside getCartList" + carts.toString());
    }
    List<CartModel> cartList = [];
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.Cart_History_List)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.Cart_History_List)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
    }
    for (int i = 0; i < cart.length; i++) {
      // print("history list" + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.Cart_History_List, cartHistory);
    print("the lengh of history list is" +
        getCartHistoryList().length.toString());
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.Cart_List);
  }
}
