import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final forgotEmailController = TextEditingController();

  // Simple login validation
  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email and Password are required",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } else {
      Get.snackbar("Success", "Login successful",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  // Forgot password validation
  void forgotPassword() {
    if (forgotEmailController.text.isEmpty ||
        !forgotEmailController.text.contains("@")) {
      Get.snackbar("Error", "Please enter a valid email",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } else {
      Get.snackbar("Success", "Reset link sent to ${forgotEmailController.text}",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  // Register validation
  void register() {
    if (registerEmailController.text.isEmpty ||
        registerPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } else if (registerPasswordController.text !=
        confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } else {
      Get.snackbar("Success", "Account created successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.back(); // navigate back to login
    }
  }
}
