import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // --- COLORS ---
  static const Color blueColor = Color(0xFF076599);
  static const Color redColor = Color(0xFFC53131);
  static const Color skyBlueColor = Color(0xFFF0F9FF);
  static const Color greenColor = Color(0xFF66A321);
  static const Color darkTextColor = Color(0xFF333333);
  static const Color lightTextColor = Color(0xFF666666);
  static const Color defaultBorderColor = Color(0xFFBDBDBD);

  // --- BORDER STYLES ---
  static final OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(color: defaultBorderColor, width: 1.0),
    borderRadius: BorderRadius.circular(6),
  );

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: greenColor, width: 1.5),
    borderRadius: BorderRadius.circular(6),
  );

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: redColor, width: 1.0),
    borderRadius: BorderRadius.circular(6),
  );

  // --- TEXT STYLES ---
  static TextStyle get title => GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.bold, color: darkTextColor);

  static TextStyle get subtitle => GoogleFonts.poppins(
      fontSize: 14, color: lightTextColor);

  static TextStyle get label => GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: darkTextColor);

  static TextStyle get buttonText => GoogleFonts.poppins(
      fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600);

  static TextStyle get errorText => GoogleFonts.poppins(
      color: redColor, fontSize: 13);

  // --- BUTTON STYLE ---
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: blueColor,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );

  // --- INPUT DECORATION (FIXED) ---
  // This is now a method that returns an InputDecoration object
  static InputDecoration getInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      enabledBorder: defaultBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      errorStyle: errorText,
    );
  }
}
