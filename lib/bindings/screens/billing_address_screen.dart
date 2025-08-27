import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/styles.dart';

class BillingAddressScreen extends StatelessWidget {
  const BillingAddressScreen({super.key});

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
                  _buildHeader("Billing Address"),
                  const SizedBox(height: 30),
                  // All the new fields have been added here
                  _buildTextField(label: "First Name", validator: (val) => val!.isEmpty ? "First Name is required" : null),
                  _buildTextField(label: "Last Name", validator: (val) => val!.isEmpty ? "Last Name is required" : null),
                  _buildTextField(label: "Email", validator: (val) {
                    if (val == null || val.isEmpty) return "Email is required";
                    if (!GetUtils.isEmail(val)) return "Please enter a valid email";
                    return null;
                  }, keyboardType: TextInputType.emailAddress),
                  _buildTextField(label: "Mobile Number", validator: (val) => val!.isEmpty ? "Mobile Number is required" : null, keyboardType: TextInputType.phone),
                  _buildTextField(label: "Address Line 1", validator: (val) => val!.isEmpty ? "Address is required" : null),
                  _buildTextField(label: "Address Line 2"), // Optional field
                  _buildTextField(label: "State", validator: (val) => val!.isEmpty ? "State is required" : null),
                  _buildTextField(label: "City", validator: (val) => val!.isEmpty ? "City is required" : null),
                  _buildTextField(label: "Country", validator: (val) => val!.isEmpty ? "Country is required" : null),
                  _buildTextField(label: "Zip Code", validator: (val) => val!.isEmpty ? "Zip Code is required" : null, keyboardType: TextInputType.number),
                  const SizedBox(height: 30),
                  _buildEditButton(_formKey),
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
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.label),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: keyboardType,
          decoration: AppStyles.getInputDecoration(),
          validator: validator,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildEditButton(GlobalKey<FormState> formKey) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // Handle edit/save action
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.redColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
        child: Text("Edit", style: AppStyles.buttonText.copyWith(fontSize: 14)),
      ),
    );
  }
}
