import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utilities/styles.dart';

import '../../routes/app_pages.dart';

import '../../widgets/delete_confirmation_dialog.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.skyBlueColor,
      appBar: AppBar(
        title: Text("Account Settings", style: AppStyles.title),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: AppStyles.darkTextColor),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            constraints: const BoxConstraints(maxWidth: 400),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://placehold.co/150x150/png',
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return const CircleAvatar(radius: 60);
                  },
                ),
                const SizedBox(height: 24),
                _buildDeleteButton(context),
                const SizedBox(height: 16),
                _buildOptionButton(
                  text: "My Profile",
                  isPrimary: true,
                  onTap: () => Get.toNamed(AppPages.myProfile),
                ),
                const SizedBox(height: 12),
                _buildOptionButton(
                  text: "Company Profile",
                  onTap: () => Get.toNamed(AppPages.companyProfile),
                ),
                const SizedBox(height: 12),
                _buildOptionButton(
                  text: "Billing Address",
                  onTap: () => Get.toNamed(AppPages.billingAddress),
                ),
                const SizedBox(height: 12),
                _buildOptionButton(
                  text: "Change Password",
                  onTap: () => Get.toNamed(AppPages.changePassword),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => showDeleteConfirmationDialog(context),
      icon: const Icon(Icons.delete_outline, color: Colors.white),
      label: Text("Delete Account", style: AppStyles.buttonText.copyWith(fontSize: 14)),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyles.redColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required String text,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFF8FA5C5) : const Color(0xFFF0F0F0),
        foregroundColor: isPrimary ? Colors.white : AppStyles.darkTextColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      child: Text(text, style: AppStyles.buttonText.copyWith(
        color: isPrimary ? Colors.white : AppStyles.darkTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      )),
    );
  }
}
