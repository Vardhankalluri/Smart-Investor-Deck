import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/styles.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Keys and controllers are now local variables inside the build method.
    final _formKey = GlobalKey<FormState>();
    final _newPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppStyles.skyBlueColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            constraints: const BoxConstraints(maxWidth: 450),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader("Change Password"),
                  const SizedBox(height: 30),
                  _buildTextField(
                    label: "New Password",
                    controller: _newPasswordController,
                    validator: (val) {
                      if (val == null || val.isEmpty) return "New Password is required";
                      if (val.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                    obscureText: true,
                  ),
                  _buildTextField(
                    label: "Confirm New Password",
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Please confirm your password";
                      if (val != _newPasswordController.text) return "Passwords do not match";
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  _buildChangePasswordButton(_formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppStyles.defaultBorderColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(title, style: AppStyles.title.copyWith(fontSize: 20)),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: AppStyles.getInputDecoration(),
          validator: validator,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildChangePasswordButton(GlobalKey<FormState> formKey) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // Handle change password logic
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.redColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
        child: Text("Change Password", style: AppStyles.buttonText),
      ),
    );
  }
}
