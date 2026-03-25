import 'package:carpool_admin/utils/theme/app_sizes.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Reusable card widget for portal selection
/// Displays an icon, title, and description with hover effects
class PortalSelectionCard extends StatefulWidget {
  final String iconAssetPath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const PortalSelectionCard({
    super.key,
    required this.iconAssetPath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  State<PortalSelectionCard> createState() => _PortalSelectionCardState();
}

class _PortalSelectionCardState extends State<PortalSelectionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppSizes.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 6),
          curve: Curves.easeInOut,
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 340,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 38,
            vertical: isMobile ? 32 : 34,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.black.withOpacity(0.6)
                    : Colors.black.withOpacity(0.32),
                blurRadius: _isHovered ? 12 : 6,
                offset: Offset(4, _isHovered ? 0 : 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Container
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF656565), // Icon background gray
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    widget.iconAssetPath,
                    width: 26,
                    height: 26,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                widget.description,
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: isMobile ? 10 : 12,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
