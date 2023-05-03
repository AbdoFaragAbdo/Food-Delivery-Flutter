import 'package:food_delivery_ecommerce/data/repository/auth_repo.dart';
import 'package:food_delivery_ecommerce/models/sign_up_body_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  registration(SignUpBody signUpBody) {
    _isLoaded = true;
    authRepo.registration(signUpBody);
  }
}
