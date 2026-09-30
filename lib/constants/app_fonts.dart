import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Palet warna tema "Pulpen Kita".
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1E3A8A); // biru tinta
  static const Color primaryLight = Color(0xFFDBE4FF);
  static const Color background = Color(0xFFF8F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFF59E0B); // kuning emas
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color disabled = Color(0xFFCBD5E1);
  static const Color border = Color(0xFFE5E7EB);
}

/// Typography system berbasis Poppins.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get headline => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get title => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get subtitle => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  static TextStyle get body => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get caption => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get price => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      );

  static TextStyle get button => GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
}
