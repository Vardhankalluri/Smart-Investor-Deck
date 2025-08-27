import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/login_controller.dart';
import '../../utilities/snackbar_view.dart';
import '../../utilities/styles.dart';

class ForgotPasswordScreen extends GetView<LoginController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.skyBlueColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/your_logo.png',
                      height: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return RichText(
                          text: TextSpan(
                            style: AppStyles.title,
                            children: const [
                              TextSpan(
                                  text: "smart ",
                                  style: TextStyle(color: AppStyles.redColor)),
                              TextSpan(
                                  text: "investor deck",
                                  style: TextStyle(color: AppStyles.darkTextColor)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text("Forgot Your Password?",
                        style: AppStyles.title),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Enter your email and we will send you instructions to reset your password.",
                      textAlign: TextAlign.center,
                      style: AppStyles.subtitle,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text("Email", style: AppStyles.label),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: AppStyles.getInputDecoration(), // <-- FIXED
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!GetUtils.isEmail(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppStyles.primaryButtonStyle,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          SnackBarView.showSuccess(
                            title: "Success",
                            message: "Password reset link sent to your email",
                          );
                        }
                      },
                      child: Text("Confirm", style: AppStyles.buttonText),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Remember your password?",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: controller.goToLogin,
                          child: Text(
                            "Back to Sign In",
                            style: GoogleFonts.poppins(
                                color: AppStyles.blueColor, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
