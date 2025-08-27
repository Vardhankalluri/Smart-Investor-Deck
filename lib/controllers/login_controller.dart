import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_investor_dick/data/api_calls.dart';
import 'package:smart_investor_dick/data/shared_preferences_data.dart';

import 'package:smart_investor_dick/utilities/snackbar_view.dart';
import '../../routes/app_pages.dart';
import '../data/route_urls.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var rememberMe = false.obs;
  var isPasswordHidden = true.obs;

  final formKey = GlobalKey<FormState>();
  final ApiCalls _apiCalls = ApiCalls();
  final SharedPreferencesData _prefs = SharedPreferencesData();

  @override
  void onInit() {
    super.onInit();
    _loadRememberedCredentials();
  }

  // Load saved credentials when the controller starts
  Future<void> _loadRememberedCredentials() async {
    final remembered = await _prefs.getRememberMe();
    rememberMe.value = remembered;
    if (remembered) {
      emailController.text = await _prefs.getSavedEmail() ?? '';
      passwordController.text = await _prefs.getSavedPassword() ?? '';
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      SnackBarView.showLoading(message: "Logging in, please wait...");

      try {
        final Map<String, dynamic> data = {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        };

        final response = await _apiCalls.postMethod(RouteUrls.loginUrl, data);

        Get.closeCurrentSnackbar();

        debugPrint("Response Status: ${response.statusCode}");
        debugPrint("Response Body: ${response.data}");

        // --- CRITICAL FIX ---
        // This logic now correctly handles the API response.
        // It will ONLY navigate if the status is 200 AND an access token is present.
        if (response.statusCode == 200 && response.data != null && response.data['access'] != null) {
          // --- SUCCESS LOGIC ---
          await _prefs.setAccessToken(response.data['access']);
          await _prefs.setRefreshToken(response.data['refresh']);

          // Handle "Remember Me" logic
          await _prefs.setRememberMe(rememberMe.value);
          if (rememberMe.value) {
            await _prefs.setSavedEmail(emailController.text.trim());
            await _prefs.setSavedPassword(passwordController.text.trim());
          } else {
            await _prefs.clearSavedCredentials();
          }

          SnackBarView.showSuccess(title: "Success", message: "Login successful!");
          Get.offAllNamed(AppPages.dashboard);

        } else {
          // --- FAILURE LOGIC ---
          // This block will now execute for any non-200 status code.
          String errorMessage = "An unknown error occurred.";
          if (response.data != null && response.data['detail'] != null) {
            errorMessage = response.data['detail'];
          } else if (response.data != null && response.data['error'] != null) {
            errorMessage = response.data['error'];
          }

          SnackBarView.showErrorMessage(
            title: "Login Failed",
            message: errorMessage,
          );
        }
      } catch (e) {
        Get.closeCurrentSnackbar();
        SnackBarView.showErrorMessage(
          title: "Failed",
          message: "Incorrect Email or Password.",
        );
        debugPrint("Login Error: $e");
      }
    }
  }

  Future<void> logout() async {
    await _prefs.clearTokens();
    Get.offAllNamed(AppPages.login);
  }

  void goToForgotPassword() {
    Get.toNamed(AppPages.forgotPassword);
  }

  void goToRegister() {
    Get.toNamed(AppPages.register);
  }

  void goToLogin() {
    Get.offNamed(AppPages.login);
  }
}
