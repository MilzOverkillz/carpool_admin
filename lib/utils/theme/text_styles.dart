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
  static const TextStyle statesCardValue = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: FontWeight.w700, // Semi-bold
    height: 1.3,
    color: AppColors.textPrimary,
  );
  static const TextStyle notificationHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 20,
    fontWeight: FontWeight.w700, // Semi-bold
    height: 1.3,
    color: AppColors.textPrimary,
  );
  static const TextStyle notificationSubHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Semi-bold
    height: 1.3,
    color: AppColors.blackText200,
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
  static const TextStyle notificationTableHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.blackText200, // Muted color as seen in table headers
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
  static const TextStyle filterSearchText = TextStyle(
    fontFamily: AppFonts.primary, // Inter
    fontWeight: AppFonts.normal, // 400
    fontSize: 14,
    color: AppColors.filterText, // #1D1929
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );
  static const TextStyle notificationBodyMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.black,
  );
  // Used for table rows (e.g., "Maduwantha Herath")
  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );
  static const TextStyle pageHeaderTitle = TextStyle(
    fontFamily: AppFonts.primary, // Inter
    fontSize: 18,
    fontWeight: AppFonts.bold, // 700
    height: 1.55, // 28px line-height / 18px size
    color: Color(0xFF212B36),
  );

  static const TextStyle pageHeaderSubtitle = TextStyle(
    fontFamily: AppFonts.dmSans, // DM Sans
    fontSize: 12,
    fontWeight: AppFonts.normal, // 400
    height: 1.66, // 20px line-height / 12px size
    letterSpacing: -0.24, // -2% of 12px
    color: Color(0xFF9EA2A5),
  );
  static const TextStyle statesCardLabel = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
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
  static const TextStyle primaryButtonText = TextStyle(
    fontFamily: AppFonts.primary, // Inter
    fontSize: 14,
    fontWeight: AppFonts.normal, // 400
    color: Color(0xFFFFFFFF),
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
  static const TextStyle notificationCaption = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: AppColors.blackText100,
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
    color: AppColors.authHeading,
  );
  static const TextStyle authContainerSubHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: AppColors.authSubHeading,
  );
  static const TextStyle authActiveTextField = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: AppColors.authHeading,
  );
  static const TextStyle authHintTextField = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Color(0xFF9A9A9A),
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
  static const TextStyle sidebarLogo = TextStyle(
    fontFamily: AppFonts.nunitoSans,
    fontSize: 20,
    fontWeight: AppFonts.extrabold, // 800
    color: Color(0xFF1E272E),
  );

  static const TextStyle sidebarMenuText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: AppFonts.semibold, // 600
    letterSpacing: 0.3,
    // Note: Color is omitted here because it changes dynamically
    // depending on whether the tab is Active (White) or Inactive (Dark Gray).
  );

  static const TextStyle sidebarAvatarText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: AppFonts.semibold, // 600
    color: Colors.white,
  );

  static const TextStyle sidebarProfileName = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: AppFonts.medium, // 500
    color: Color(0xFF1E272E),
  );

  static const TextStyle sidebarProfileEmail = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 10,
    fontWeight: AppFonts.normal, // 400
    color: Color(0xFF828282),
  );

  static const TextStyle sidebarLogoutText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13,
    fontWeight: AppFonts.medium, // 500
    color: AppColors.textSecondary,
  );
  static const TextStyle topBarTitle = TextStyle(
    fontFamily: AppFonts.primary, // Inter
    fontSize: 30,
    fontWeight: AppFonts.bold, // 700
    letterSpacing: -0.5,
    color: Color(0xFF323D4E),
  );

  static const TextStyle searchHintText = TextStyle(
    fontFamily: AppFonts.dmSans, // DM Sans
    fontWeight: AppFonts.normal, // 400
    fontSize: 14,
    height: 1.4, // 20px line height / 14px size
    letterSpacing: -0.28, // -2%
    color: Color(0xFF495056),
  );

  static const TextStyle searchInputText = TextStyle(
    fontFamily: AppFonts.dmSans, // DM Sans
    fontWeight: AppFonts.normal, // 400
    fontSize: 14,
    color: AppColors.textPrimary,
  );
}
