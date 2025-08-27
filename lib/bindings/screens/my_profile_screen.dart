import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/styles.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The form key is now a local variable within the build method.
    final _formKey = GlobalKey<FormState>();

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
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppStyles.defaultBorderColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "My Profile",
                        style: AppStyles.title.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Form Fields
                  _buildTextField(label: "First Name", validator: (val) => val!.isEmpty ? "First Name is required" : null),
                  _buildTextField(label: "Last Name", validator: (val) => val!.isEmpty ? "Last Name is required" : null),
                  _buildTextField(label: "Email", initialValue: "ashok.n@pranathiss.com", enabled: false),
                  _buildTextField(label: "Mobile Number", validator: (val) => val!.isEmpty ? "Phone Number is required" : null, keyboardType: TextInputType.phone),

                  const SizedBox(height: 30),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyles.redColor,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        ),
                        child: Text("Cancel", style: AppStyles.buttonText.copyWith(fontSize: 14)),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle save action
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyles.blueColor,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        ),
                        child: Text("Save", style: AppStyles.buttonText.copyWith(fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for building text fields
  Widget _buildTextField({
    required String label,
    String? initialValue,
    FormFieldValidator<String>? validator,
    bool enabled = true,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          keyboardType: keyboardType,
          decoration: AppStyles.getInputDecoration(),
          validator: validator,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
