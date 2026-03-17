import 'package:flutter/material.dart';

/// Application color palette
/// Single source of truth for all colors used in the app, 
/// tailored for a minimal, monochrome dashboard design.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ==========================================
  // Brand & Primary Colors
  // ==========================================
  static const Color primary = Color(0xFF111827); // Dark Slate/Black
  static const Color primaryDark = Color(0xFF000000); // Pure Black (Sign In Button)
  static const Color primaryLight = Color(0xFF374151);
  static const Color black = Color(0xFF000000); // Lighter Slate (Sidebar active item)

  // ==========================================
  // Backgrounds & Surfaces
  // ==========================================
  static const Color background = Color(0xFFF3F4F6); // Very light gray (App background)
  static const Color surface = Color(0xFFF4F7FE); // White (Cards, Modals, Inputs)
  static const Color surfaceSecondary = Color(0xFFF9FAFB); // Slightly off-white surface
  
  // Interactive Surfaces (Buttons, Tags)
  static const Color buttonSecondaryBg = Color(0xFFE5E7EB); // Light gray (Process Refund button)
  static const Color tagBg = Color(0xFFE5E7EB); 
  static const Color white = Color(0xFFFFFFFF);// Light gray (Pending/Approved pills)

  // ==========================================
  // Text Colors
  // ==========================================
  static const Color textPrimary = Color(0xFF111827); // Main headings, primary data
  static const Color textSecondary = Color(0xFF4B5563); // Subtitles, table headers, labels
  static const Color textTertiary = Color(0xFF6B7280); // Muted text, captions
  static const Color textHint = Color(0xFF9CA3AF); // Placeholder text in inputs
  static const Color textInverse = Color(0xFFFFFFFF); // Text on dark backgrounds (Sign in btn)
  static const Color authHeading = Color(0xFF232323);
  static const Color authSubHeading = Color(0xFF969696);
  static const Color tabsSelection = Color(0xFFE1E1E1);

  // ==========================================
  // Borders & Dividers
  // ==========================================
  static const Color divider = Color(0xFFE5E7EB); // Soft lines separating table rows
  static const Color border = Color(0xFFD1D5DB); // Standard borders (Cards, inactive inputs)
  
  // Input specific
  static const Color inputBorder = Color(0xFFD1D5DB); // Inactive input border
  static const Color inputFocusBorder = Color(0xFF111827); // Active input border (Black as seen in Sign Up)
  static const Color inputErrorBorder = Color(0xFFEF4444); // Error state border

  // ==========================================
  // Status & Semantic Colors
  // ==========================================
  static const Color success = Color(0xFF10B981); // Green (Positive trend arrows)
  static const Color error = Color(0xFFEF4444); // Red (Alert icons)
  static const Color warning = Color(0xFFF59E0B); // Orange (Warnings)
  static const Color info = Color(0xFF3B82F6); // Blue (General info/links)

  // ==========================================
  // Icons & Overlays
  // ==========================================
  static const Color iconPrimary = Color(0xFF4B5563); // Standard icon color
  static const Color iconActive = Color(0xFF111827); // Active icon color
  static const Color iconDisabled = Color(0xFFD1D5DB); // Disabled icon color
  
  static const Color scrim = Color(0x66000000); // Semi-transparent black for modal backgrounds
  static const Color shadow = Color(0x0A000000); // Very subtle shadow for cards

  // Button Colors
  static const Color backButtonColor = Color(0xFFE4E4E4);
  static const Color backButtonArrowColor = Color(0xFF626262);
  static const Color authContainerColor = Color(0xFFF1F1F1);

  // ==========================================
  // Filter Bar & Header Specific Colors
  // ==========================================
  static const Color filterBorder = Color(0xFFE9E9EA); 
  static const Color filterText = Color(0xFF1D1929);
  
  static const Color pageHeaderTitle = Color(0xFF212B36);
  static const Color pageHeaderSubtitle = Color(0xFF9EA2A5);
  static const Color primaryButtonBg = Color(0xFF495056);
  
  // Progress Bar Specific Colors
  static const Color barFillGrey = Color(0xFFC0C0C0); 
  static const Color barTrackGrey = Color(0xFFE9E9EA);

  
  // The subtle grey used for the role/status pills and filter bar
  static const Color tagPillBg = Color(0xFFC7C9CB); // #C7C9CB from roles/status pills

  static const Color purpleText = Color(0xFF6B7280); // Lighter purple for role pill text
  static const Color outlinedButtonText = Color(0xFF6B7280); // Outlined button text color (purple)
  static const Color outlinedButtonBorder = Color(0xFFE9E9EA);
  
}