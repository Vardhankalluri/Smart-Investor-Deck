import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/styles.dart';

Future<void> showContactUsDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: ConstrainedBox(
          // FIX: Reduced the max width to make the dialog smaller
          constraints: const BoxConstraints(maxWidth: 380),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
                    children: [
                      // FIX: Wrapped the Text in Expanded to allow it to wrap
                      Expanded(
                        child: Text(
                          "Contact Us for Bulk Pricing",
                          style: AppStyles.title.copyWith(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.close),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(
                    label: "Full Name",
                    isMandatory: true,
                    validator: (val) => val!.isEmpty ? "Full Name is required" : null,
                  ),
                  _buildTextField(
                    label: "Company Name",
                    isMandatory: true,
                    validator: (val) => val!.isEmpty ? "Company Name is required" : null,
                  ),
                  _buildTextField(
                    label: "Mobile Number",
                    isMandatory: true,
                    validator: (val) => val!.isEmpty ? "Mobile Number is required" : null,
                    keyboardType: TextInputType.phone,
                  ),
                  _buildTextField(
                    label: "Email",
                    isMandatory: true,
                    validator: (val) => val!.isEmpty ? "Email is required" : null,
                  ),
                  _buildTextField(
                    label: "No. of Business Ideas",
                    isMandatory: true,
                    validator: (val) => val!.isEmpty ? "This field is required" : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
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
                          if (formKey.currentState!.validate()) {
                            // Handle submit action
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyles.blueColor,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        ),
                        child: Text("Submit", style: AppStyles.buttonText.copyWith(fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildTextField({
  required String label,
  String? initialValue,
  FormFieldValidator<String>? validator,
  bool enabled = true,
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
