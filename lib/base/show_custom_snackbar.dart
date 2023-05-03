import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/widgets/Big_Text.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String message,
    {bool isError = true, String title = "Eror"}) {
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent);
}
