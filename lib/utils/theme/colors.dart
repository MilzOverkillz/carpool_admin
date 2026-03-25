import 'package:flutter/material.dart';

/// Application color palette
/// Single source of truth for all colors used in the app,
/// tailored for a minimal, monochrome dashboard design.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ==========================================
  // Brand & Primary Colors
  // ==========================================
  static const Color primary = Color(0xFF111827);
  static const Color primaryDark = Color(0xFF000000);
  static const Color primaryLight = Color(0xFF374151);
  static const Color black = Color(0xFF000000);

  // ==========================================
  // Backgrounds & Surfaces
  // ==========================================
  static const Color background = Color(0xFFF3F4F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSecondary = Color(0xFFF9FAFB);
  static const Color mainBackground = Color(0xFFF4F7FE);
  static const Color white = Color(0xFFFFFFFF);

  // ==========================================
  // Interactive Surfaces
  // ==========================================
  static const Color buttonSecondaryBg = Color(0xFFE5E7EB);
  static const Color tagBg = Color(0xFFE5E7EB);
  static const Color tagPillBg = Color(0xFFC7C9CB);
  static const Color sendNotificationButton = Color(0xFFD9D9D9);

  // ==========================================
  // Text Colors
  // ==========================================
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textTertiary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color textHint2 = Color(0xFF9A9A9A);
  static const Color blackText100 = Color(0xFFC7C9CB);
  static const Color blackText200 = Color(0xFF9EA2A5);
  static const Color blackText400 = Color(0xFF495056);
  static const Color blackTextTitle = Color(0xFF212B36);
  static const Color blackTextTitleTem = Color(0xFF9A9A9A);
  static const Color authHeading = Color(0xFF232323);
  static const Color authSubHeading = Color(0xFF969696);
  static const Color tabsSelection = Color(0xFFE1E1E1);
  static const Color purpleText = Color(0xFF6B7280);
  static const Color outlinedButtonText = Color(0xFF6B7280);
  static const Color outlinedButtonBorder = Color(0xFFE9E9EA);
  static const Color pillBox = Color(0xFFD6D5D5);
  static const Color pillBox1 = Color(0xFF737373);
  static const Color pillBox2 = Color(0xFFBFBFBF);

  // ==========================================
  // Borders & Dividers
  // ==========================================
  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFD1D5DB);
  static const Color inputBorder = Color(0xFFD1D5DB);
  static const Color inputFocusBorder = Color(0xFF111827);
  static const Color inputErrorBorder = Color(0xFFEF4444);
  static const Color searchBorder = Color(0xFFE9E9EA);
  static const Color channelsBorder = Color(0xFFC3C3C3);
  static const Color tableBorder = Color(0xFFE2E8F0);

  // ==========================================
  // Status & Semantic Colors
  // ==========================================
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // ==========================================
  // Icons & Overlays
  // ==========================================
  static const Color iconPrimary = Color(0xFF4B5563);
  static const Color iconActive = Color(0xFF111827);
  static const Color iconDisabled = Color(0xFFD1D5DB);
  static const Color scrim = Color(0x66000000);
  static const Color shadow = Color(0x0A000000);

  // ==========================================
  // Buttons
  // ==========================================
  static const Color backButtonColor = Color(0xFFE4E4E4);
  static const Color backButtonArrowColor = Color(0xFF626262);
  static const Color authContainerColor = Color(0xFFF1F1F1);
  static const Color primaryButtonBg = Color(0xFF495056);

  // ==========================================
  // Filter & Header
  // ==========================================
  static const Color filterBorder = Color(0xFFE9E9EA);
  static const Color filterText = Color(0xFF1D1929);
  static const Color pageHeaderTitle = Color(0xFF212B36);
  static const Color pageHeaderSubtitle = Color(0xFF9EA2A5);

  // ==========================================
  // Progress Bar
  // ==========================================
  static const Color barFillGrey = Color(0xFFC0C0C0);
  static const Color barTrackGrey = Color(0xFFE9E9EA);
}
