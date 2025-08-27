import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/login_controller.dart';
import '../../utilities/snackbar_view.dart';
import '../../utilities/styles.dart';

class RegisterScreen extends GetView<LoginController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppStyles.skyBlueColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                    child: Text("Create Your Account Now", style: AppStyles.title),
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 25),
                  _buildTextField(
                    label: "First Name",
                    validator: (value) =>
                    value!.isEmpty ? "First Name is required" : null,
                  ),
                  _buildTextField(
                    label: "Last Name",
                    validator: (value) =>
                    value!.isEmpty ? "Last Name is required" : null,
                  ),
                  _buildTextField(
                    label: "Company Name",
                    validator: (value) =>
                    value!.isEmpty ? "Company Name is required" : null,
                  ),
                  _buildTextField(
                    label: "Email",
                    controller: controller.emailController,
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
                  _buildTextField(
                    label: "Mobile Number",
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                    value!.isEmpty ? "Mobile Number is required" : null,
                  ),
                  Text("Password", style: AppStyles.label),
                  const SizedBox(height: 8),
                  Obx(() => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: AppStyles.getInputDecoration().copyWith( // <-- FIXED
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
                  const SizedBox(height: 15),
                  Text("Confirm Password", style: AppStyles.label),
                  const SizedBox(height: 8),
                  Obx(() => TextFormField(
                    controller: confirmPasswordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: AppStyles.getInputDecoration().copyWith( // <-- FIXED
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      }
                      if (value != controller.passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  )),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppStyles.primaryButtonStyle,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          SnackBarView.showSuccess(
                            title: "Success",
                            message: "Account created successfully!",
                          );
                        }
                      },
                      child: Text("Sign Up", style: AppStyles.buttonText),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: GoogleFonts.poppins(fontSize: 14)),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                        onPressed: controller.goToLogin,
                        child: Text("Sign In",
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

  Widget _buildTextField({
    required String label,
    required FormFieldValidator<String> validator,
    TextEditingController? controller,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: AppStyles.getInputDecoration(), // <-- FIXED
          validator: validator,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
