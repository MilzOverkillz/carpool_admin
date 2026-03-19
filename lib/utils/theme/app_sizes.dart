import 'package:flutter/material.dart';

/// Application sizing and spacing constants
/// Manages spacing, sizing, and responsive breakpoints across devices
class AppSizes {
  AppSizes._(); // Private constructor to prevent instantiation

  // Device breakpoints for responsive design
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 1200;

  // Spacing scale (based on 8dp grid system)
  static const double xs = 4;
  static const double smm = 5;
  static const double sm = 8;
  static const double base = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double lxg = 26;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
  static const double x4l = 96;
  static const double x5l = 120;

  // Padding and margin shortcuts
  static const double paddingXs = xs;
  static const double paddingSm = sm;
  static const double paddingMd = md;
  static const double paddingLg = lg;
  static const double paddingXl = xl;

  // Border radius
  static const double radiusXs = 4;
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 20;
  static const double radiusXXl = 24;
  static const double radiusCircle = 999;

  // Icon sizes
  static const double iconXs = 16;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 32;
  static const double iconXl = 48;

  // Button heights
  static const double buttonHeightSm = 36;
  static const double buttonHeightMd = 44;
  static const double buttonHeightLg = 56;
  static const double buttonHeightXl = 64;

  // Input field height
  static const double inputHeight = 56;
  static const double inputHeightSm = 44;

  // App bar height
  static const double appBarHeight = 56;

  // Divider height
  static const double dividerHeight = 1;

  // Elevation/Shadow
  static const double elevationNone = 0;
  static const double elevationSm = 1;
  static const double elevationMd = 4;
  static const double elevationLg = 8;
  static const double elevationXl = 12;

  // Animation durations (milliseconds)
  static const Duration animationDurationFast = Duration(milliseconds: 150);
  static const Duration animationDurationNormal = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // Get responsive padding based on screen width
  static EdgeInsets getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < tabletBreakpoint) {
      return const EdgeInsets.all(md);
    } else if (width < tabletBreakpoint) {
      return const EdgeInsets.all(lg);
    } else {
      return const EdgeInsets.all(xl);
    }
  }

  static EdgeInsets getResponsivePaddingSymmetric(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < tabletBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: md);
    } else if (width < tabletBreakpoint) {
      return const EdgeInsets.symmetric(horizontal: lg);
    } else {
      return const EdgeInsets.symmetric(horizontal: xl);
    }
  }

  // Get responsive font scale based on screen width
  static double getResponsiveFontScale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < tabletBreakpoint) {
      return 1.0;
    } else if (width < tabletBreakpoint) {
      return 1.1;
    } else {
      return 1.2;
    }
  }

  // Check if device is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < desktopBreakpoint;
  }

  // Check if device is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= desktopBreakpoint && width < desktopBreakpoint;
  }

  // Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  // Get device orientation
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Get safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  // Get available screen height (accounting for safe area)
  static double getAvailableHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  // Get available screen width
  static double getAvailableWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //check if keyboard appears or disappears
  static bool isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}
