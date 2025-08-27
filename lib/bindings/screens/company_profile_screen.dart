import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/styles.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({super.key});

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
                  _buildHeader("Company Profile"),
                  const SizedBox(height: 30),
                  // Updated Fields
                  _buildTextField(
                    label: "Company Name",
                    isMandatory: true,
                    validator: (val) => val!.isEmpty ? "Company Name is required" : null,
                  ),
                  _buildTextField(label: "Company Website", keyboardType: TextInputType.url),
                  _buildTextField(label: "Company Tagline"),
                  _buildLogoUploader(),
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
    bool isMandatory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppStyles.label),
            if (isMandatory)
              const Text(" *", style: TextStyle(color: AppStyles.redColor, fontSize: 16)),
          ],
        ),
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

  Widget _buildLogoUploader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Company Logo", style: AppStyles.label),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppStyles.defaultBorderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle file picking logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  elevation: 0,
                ),
                child: const Text("Choose file", style: TextStyle(color: AppStyles.darkTextColor)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "No file chosen",
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://placehold.co/100x100/png'), // Placeholder for logo
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
