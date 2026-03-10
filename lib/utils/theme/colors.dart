import 'package:flutter/material.dart';

/// Application color palette
/// Single source of truth for all colors used in the app, 
/// tailored for a minimal, monochrome dashboard design.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ==========================================
  // Brand & Primary Colors
  // ==========================================
  // The primary color in this design is essentially black/dark slate.
  static const Color primary = Color(0xFF111827); // Dark Slate/Black
  static const Color primaryDark = Color(0xFF000000); // Pure Black (Sign In Button)
  static const Color primaryLight = Color(0xFF374151); // Lighter Slate (Sidebar active item)

  // ==========================================
  // Backgrounds & Surfaces
  // ==========================================
  static const Color background = Color(0xFFF3F4F6); // Very light gray (App background)
  static const Color surface = Color(0xFFFFFFFF); // White (Cards, Modals, Inputs)
  static const Color surfaceSecondary = Color(0xFFF9FAFB); // Slightly off-white surface
  
  // Interactive Surfaces (Buttons, Tags)
  static const Color buttonSecondaryBg = Color(0xFFE5E7EB); // Light gray (Process Refund button)
  static const Color tagBg = Color(0xFFE5E7EB); // Light gray (Pending/Approved pills)

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

}