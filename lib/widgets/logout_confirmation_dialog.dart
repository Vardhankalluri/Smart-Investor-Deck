import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../utilities/styles.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) {
  final LoginController loginController = Get.find();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppStyles.redColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout, color: AppStyles.redColor, size: 32),
              ),
              const SizedBox(height: 20),
              Text(
                "Confirm Logout",
                style: AppStyles.title.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                "Are you sure you want to log out of your account?",
                textAlign: TextAlign.center,
                style: AppStyles.subtitle,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppStyles.darkTextColor,
                      side: const BorderSide(color: AppStyles.defaultBorderColor),
                      // FIX: Decreased padding to prevent overflow
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // Close the dialog first
                      loginController.logout(); // Then call the logout method
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.redColor,
                      // FIX: Decreased padding to prevent overflow
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Text("Logout", style: AppStyles.buttonText),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
