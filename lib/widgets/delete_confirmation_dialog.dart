import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utilities/styles.dart';

Future<void> showDeleteConfirmationDialog(BuildContext context) {
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
                child: const Icon(Icons.delete_outline, color: AppStyles.redColor, size: 32),
              ),
              const SizedBox(height: 20),
              Text(
                "Confirm Delete",
                style: AppStyles.title.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                "Are you sure you want to delete your Account? This action cannot be undone.",
                textAlign: TextAlign.center,
                style: AppStyles.subtitle,
              ),
              const SizedBox(height: 30),
              // FIX: Replaced Wrap with Row and adjusted button padding
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppStyles.darkTextColor,
                      side: const BorderSide(color: AppStyles.defaultBorderColor),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14), // Decreased size
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle final delete action here
                      Get.back(); // Close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.redColor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14), // Decreased size
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Text("Delete", style: AppStyles.buttonText),
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
