import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Controllers for text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observables for validation and error messages
  var emailError = RxString('');
  var passwordError = RxString('');
  var confirmPasswordError = RxString('');
  var isFormValid = false.obs;

  // Auto-validate the form
  void validateForm() {
    // Validate Email
    emailError.value =
        _isEmailValid(emailController.text.trim())
            ? ''
            : 'Invalid email format';

    // Validate Password
    passwordError.value =
        _isPasswordValid(passwordController.text.trim())
            ? ''
            : 'Password must be at least 8 characters';

    // Validate Confirm Password
    confirmPasswordError.value =
        passwordController.text.trim() == confirmPasswordController.text.trim()
            ? ''
            : 'Passwords do not match';

    // Update the form validity
    isFormValid.value =
        emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty;
  }

  // Validate Email format
  bool _isEmailValid(String email) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
    );
    return emailRegex.hasMatch(email);
  }

  // Validate Password (Minimum 8 characters)
  bool _isPasswordValid(String password) {
    return password.length >= 8;
  }

  // Logic for signing up a user
  void signUserIn() {
    validateForm();

    if (isFormValid.value) {
      // Proceed with signup
      print("Signing up user with email: ${emailController.text.trim()}");
      // After successful signup, navigate to another screen
      // Get.to(AnotherScreen());
    } else {
      print("Form is not valid");
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Listeners to auto-validate the form on text changes
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
    confirmPasswordController.addListener(validateForm);
  }

  @override
  void onClose() {
    super.onClose();
    // Dispose controllers when the view is disposed
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
