import 'package:carpool_admin/utils/theme/app_sizes.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/cards/portal_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


/// Admin Portal Selection Screen
/// Allows users to choose between Platform Admin and Company Admin portals
class AdminPortalSelection extends StatelessWidget {
  const AdminPortalSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure white background outside container
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: AppSizes.isMobile(context) ? 500 : 750,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.isMobile(context) ? 40 : 0,
                vertical: AppSizes.isMobile(context) ? 48 : 64,
              ),
              decoration: BoxDecoration(
                // Gradient background INSIDE the container only
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFF1F1F1),
                    Color(0xFFF1F1F1),
                    Color(0xFFB9B3B3),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
                borderRadius: BorderRadius.circular(25),
                // Container shadow (floating effect)
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.22),
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Section
                  _buildHeader(context),
                  
                  SizedBox(
                    height: AppSizes.isMobile(context) ? 40 : 56,
                  ),

                  // Cards Section
                  _buildCardsSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Build header with title and subtitle
  Widget _buildHeader(BuildContext context) {
    final isMobile = AppSizes.isMobile(context);
    
    return Column(
      children: [
        // Main Title - "Connect Your Carpool"
        Text(
          'Connect Your Carpool',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: isMobile ? 36 : 42,
            fontWeight: FontWeight.w700,
            height: 1.2,
            letterSpacing: -0.5,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),

        // Subtitle - "Admin Login"
        Text(
          'Admin Login',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: isMobile ? 36 : 42,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: const Color(0xFF5A5A5A), // Muted gray
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),

        // Description - "Select your portal to continue"
        Text(
          'Select your portal to continue',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF848484), // Light gray
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Build the two portal selection cards
  Widget _buildCardsSection(BuildContext context) {
    final isMobile = AppSizes.isMobile(context);
    
    if (isMobile) {
      // Stack vertically on mobile
      return Column(
        children: [
          PortalSelectionCard(
            iconAssetPath: 'assets/icons/shield.svg',
            title: 'Platform Admin',
            description: 'Manage the entire carpool platform,\ncompanies, users, rides, and payments',
            onTap: () => context.go('/'),
          ),
          const SizedBox(height: 30),
          PortalSelectionCard(
            iconAssetPath: 'assets/icons/building.svg',
            title: 'Company Admin',
            description: 'Manage companies , company\'s\nemployees, rides, and view analytics',
            onTap: () => context.go('/company-admin-sign-in'),
          ),
        ],
      );
    } else {
      // Display side by side on tablet/desktop
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: PortalSelectionCard(
              iconAssetPath: 'assets/icons/shield.svg',
              title: 'Platform Admin',
              description: 'Manage the entire carpool platform,\ncompanies, users, rides, and payments',
              onTap: () => context.go('/'),
            ),
          ),
          const SizedBox(width: 30),
          Flexible(
            child: PortalSelectionCard(
              iconAssetPath: 'assets/icons/building.svg',
              title: 'Company Admin',
              description: 'Manage companies , company\'s\nemployees, rides, and view analytics',
              onTap: () => context.go('/company-admin-sign-in'),
            ),
          ),
        ],
      );
    }
  }
}