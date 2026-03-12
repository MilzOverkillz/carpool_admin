import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

/// Application text styles
/// Centralized typography system tailored for a modern Admin Dashboard.
class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation

  // ==========================================
  // Display & Hero Styles 
  // ==========================================
  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 30,
    fontWeight: FontWeight.w700, // Bold
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi-bold
    height: 1.3,
    color: AppColors.textPrimary,
  );

  // ==========================================
  // Dashboard & Table Headings
  // ==========================================
  static const TextStyle tableHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.textSecondary, // Muted color as seen in table headers
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // ==========================================
  // Body Styles (Main content)
  // ==========================================
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // Used for table rows (e.g., "Maduwantha Herath")
  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // ==========================================
  // Label & Button Styles
  // ==========================================
  static const TextStyle labelButton = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textInverse, // White text on dark buttons
  );

  static const TextStyle labelInput = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
  );

  // Status Tag style (e.g., "Pending" or "Approved")
  static const TextStyle statusTag = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // ==========================================
  // Sidebar Styles
  // ==========================================
  static const TextStyle sidebarItem = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle sidebarItemActive = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // ==========================================
  // Helper & Status Styles
  // ==========================================
  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
  );

  static const TextStyle error = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );

  static const TextStyle successText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.success,
  );

  static const TextStyle authContainerHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w700,
    fontSize: 40,
    letterSpacing: -0.4,
    color: AppColors.authHeading
  );
  static const TextStyle authContainerSubHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: AppColors.authSubHeading
  );
  static const TextStyle authActiveTextField = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: AppColors.authHeading
  );
  static const TextStyle authHintTextField = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Color(0xFF9A9A9A)
  );
  static const TextStyle loginRememberText = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.authHeading,
  );
  static const TextStyle forgotPasswordText = TextStyle(
  fontFamily: AppFonts.primary,
  fontSize: 16,
  fontWeight: FontWeight.w500, 
  height: 1.5, 
  letterSpacing: 0,
  color: AppColors.authHeading, // Adjust based on your primary color
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.solid,
);
static const TextStyle authButtonText = TextStyle(
  fontFamily: AppFonts.primary,
  fontSize: 18,
  fontWeight: FontWeight.w600, 
  height: 1.2, 
  letterSpacing: -0.01,
  color: AppColors.background,
);
static const TextStyle verificationHeadingText = TextStyle(
  fontFamily: AppFonts.primary,
  fontSize: 32,
  fontWeight: FontWeight.w600,  
  color: AppColors.black,
);

}