import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/login_controller.dart';
import '../../utilities/styles.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                    child: Text("Log in to",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 30),
                  Text("Email", style: AppStyles.label),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: AppStyles.getInputDecoration(),
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
                  const SizedBox(height: 20),
                  Text("Password", style: AppStyles.label),
                  const SizedBox(height: 8),
                  Obx(() => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: AppStyles.getInputDecoration().copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  )),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        activeColor: AppStyles.blueColor,
                        onChanged: (val) =>
                        controller.rememberMe.value = val!,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                      )),
                      Text("Remember me",
                          style: GoogleFonts.poppins(fontSize: 14)),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                        ),
                        onPressed: controller.goToForgotPassword,
                        child: Text("Forgot password?",
                            style: GoogleFonts.poppins(
                                color: AppStyles.blueColor, fontSize: 14)),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppStyles.primaryButtonStyle,
                      onPressed: () {
                        controller.login();
                      },
                      child: Text("Sign In", style: AppStyles.buttonText),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                          style: GoogleFonts.poppins(fontSize: 14)),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                        onPressed: controller.goToRegister,
                        child: Text("Register here.",
                            style: GoogleFonts.poppins(
                                color: AppStyles.blueColor, fontSize: 14)),
                      )
                    ],
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