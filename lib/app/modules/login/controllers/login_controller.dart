import 'package:ecommerce/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  // Email and Password Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observables for error messages
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(validateEmail);
    passwordController.addListener(validatePassword);
  }

  // Validate email field
  void validateEmail() {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  // Validate password field
  void validatePassword() {
    String password = passwordController.text.trim();
    if (password.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  void login() {
    validateEmail();
    validatePassword();

    if (emailError.isNotEmpty || passwordError.isNotEmpty) {
      return; // Stop login if validation fails
    }

    String email = emailController.text.trim().toLowerCase();
    String password = passwordController.text.trim();

    if (email == "arav@gmail.com" && password == "arav@123") {
      Get.snackbar(
        "Success",
        "Login Successful!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );

      // Navigate to Home after a short delay
      Future.delayed(Duration(seconds: 2), () {
        Get.offNamed(
          '/dashboard',
        ); // Navigate & remove login from stack using named routes
      });
    } else {
      Get.snackbar(
        "Error",
        "Invalid Credentials",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
