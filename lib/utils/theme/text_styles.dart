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
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle statesCardValue = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle statesCardLabel = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle notificationHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle notificationSubHeading = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
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
    color: AppColors.textSecondary,
  );

  static const TextStyle notificationTableHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.blackText100,
  );
  static const TextStyle notificationTableHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.5,
    color: AppColors.blackText100, // Muted color as seen in table headers
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.textPrimary,
  );
  static const TextStyle dashboardTableHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xff666666),
    letterSpacing: -0.02
  );
  static const TextStyle routeText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff1d1d1d),
    letterSpacing: -0.02
  );
  static const TextStyle routeText2 = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff1d1d1d),
    letterSpacing: -0.02
  );

  static const TextStyle cardHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.55,
    color: Color(0xFF1d1d1d),
    letterSpacing: -0.02,
  );

  static const TextStyle dashboardTableHeader = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xff666666),
    letterSpacing: -0.02,
  );

  static const TextStyle companyTableHeader = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.02,
    color: Color(0xff555556),
  );

  static const TextStyle routeText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff1d1d1d),
    letterSpacing: -0.02,
  );

  static const TextStyle routeText2 = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff1d1d1d),
    letterSpacing: -0.02,
  );

  // ==========================================
  // Body Styles
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

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  // ==========================================
  // Page Header Styles
  // ==========================================
  static const TextStyle pageHeaderTitle = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 18,
    fontWeight: AppFonts.bold,
    height: 1.55,
    color: Color(0xFF212B36),
  );

  static const TextStyle pageHeaderSubtitle = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: 12,
    fontWeight: AppFonts.normal,
    height: 1.66,
    letterSpacing: -0.24,
    color: Color(0xFF9EA2A5),
  );

  // ==========================================
  // Label & Button Styles
  // ==========================================
  static const TextStyle labelButton = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textInverse,
  );

  static const TextStyle primaryButtonText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: AppFonts.normal,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle actionButtonText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.outlinedButtonText,
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
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static const TextStyle companyTableHeader = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: 14,
    fontWeight: FontWeight.w500, 
    letterSpacing: -0.02,
    color: Color(0xff555556)
  );


  static const TextStyle statusTag = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // ==========================================
  // Filter Styles
  // ==========================================
  static const TextStyle filterSearchText = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: AppFonts.normal,
    fontSize: 14,
    color: AppColors.filterText,
  );

  static const TextStyle filterDropdownText = TextStyle(
    fontFamily: AppFonts.primary,
    fontWeight: AppFonts.normal,
    fontSize: 12,
    color: AppColors.filterText,
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

  static const TextStyle sidebarLogo = TextStyle(
    fontFamily: AppFonts.nunitoSans,
    fontSize: 20,
    fontWeight: AppFonts.extrabold,
    color: Color(0xFF1E272E),
  );

  static const TextStyle sidebarMenuText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: AppFonts.semibold,
    letterSpacing: 0.3,
  );

  static const TextStyle sidebarAvatarText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: AppFonts.semibold,
    color: Colors.white,
  );

  static const TextStyle sidebarProfileName = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: AppFonts.medium,
    color: Color(0xFF1E272E),
  );

  static const TextStyle sidebarProfileEmail = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 10,
    fontWeight: AppFonts.normal,
    color: Color(0xFF828282),
  );

  static const TextStyle sidebarLogoutText = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 13,
    fontWeight: AppFonts.medium,
    color: AppColors.textSecondary,
  );

  // ==========================================
  // Top Bar Styles
  // ==========================================
  static const TextStyle topBarTitle = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 30,
    fontWeight: AppFonts.bold,
    letterSpacing: -0.5,
    color: Color(0xFF323D4E),
  );

  static const TextStyle searchHintText = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontWeight: AppFonts.normal,
    fontSize: 14,
    height: 1.4,
    letterSpacing: -0.28,
    color: Color(0xFF495056),
  );

  static const TextStyle searchInputText = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontWeight: AppFonts.normal,
    fontSize: 14,
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

  // ==========================================
  // Auth Styles
  // ==========================================
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
    color: AppColors.authHeading,
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
