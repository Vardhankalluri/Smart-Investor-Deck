import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackBarView { // Renamed this class
  // Define colors centrally so they can be reused
  static const Color greenColor = Color(0xFF66A321);
  static const Color redColor = Color(0xFFC53131);
  static const Color orangeColor = Color(0xFFFFA726); // For info messages
  static const Color blueColor = Color(0xFF076599);   // For loading messages

  /// Shows a styled success snackbar.
  /// Can optionally specify the [snackPosition].
  static void showSuccess({
    required String title,
    required String message,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(
      "", // Empty title because we use titleText
      "", // Empty message because we use messageText
      snackPosition: snackPosition,
      backgroundColor: greenColor,
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  /// Shows a styled error snackbar.
  // FIX: Renamed this method from showError to showErrorMessage
  static void showErrorMessage({required String title, required String message}) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: redColor,
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  /// Shows a styled info snackbar for general information or warnings.
  static void showInfo({required String title, required String message}) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: orangeColor,
      colorText: Colors.white,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  /// Shows a persistent loading snackbar.
  /// Call Get.closeCurrentSnackbar() to dismiss it manually.
  static void showLoading({required String message}) {
    Get.snackbar(
      "",
      "",
      backgroundColor: blueColor.withOpacity(0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      isDismissible: false, // User cannot dismiss it
      duration: const Duration(minutes: 5), // Long duration
      titleText: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "Loading",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
