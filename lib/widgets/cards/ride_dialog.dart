import 'package:flutter/material.dart';
import '../../utils/theme/text_styles.dart';
import '../nav_bar/ride_details_tab_bar.dart';
import 'details_section.dart';
import 'route_section.dart'; // <--- IMPORT THE NEW FILE

class RideDetailsDialog extends StatefulWidget {
  final String rideId;

  const RideDetailsDialog({
    Key? key,
    required this.rideId,
  }) : super(key: key);

  @override
  State<RideDetailsDialog> createState() => _RideDetailsDialogState();
}

class _RideDetailsDialogState extends State<RideDetailsDialog> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, 
      insetPadding: const EdgeInsets.all(24), 
      child: Container(
        width: 518, // EXACT Figma Dialog Width
        // The fixed height will keep the box solid and rigid when switching tabs in the video
        height: 500, // Matched total height (original 475px + the 24px overflow)
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16), 
        ),
        padding: const EdgeInsets.only(top: 26, left: 34, right: 35, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            
            const SizedBox(height: 24), 
            
            RideDetailsTabBar(
              selectedIndex: _selectedTabIndex,
              onTabChanged: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            
            const SizedBox(height: 25), 

            // --- TAB CONTENT ---
            // Wrapping this in an expanded just in case later tabs use a ListView, 
            // but for simple columns like this it's not strictly necessary.
            Expanded(
              child: Stack(
                children: [
                  // Show DetailsSection when the first tab is clicked
                  if (_selectedTabIndex == 0) ...[
                    const Positioned.fill(
                      child: DetailsSection(
                        rideStatus: 'completed', 
                        paymentStatus: 'Paid',
                      ),
                    ),
                  ],

                  // SHOW THE NEW ROUTE SECTION when the second tab (index 1) is clicked!
                  if (_selectedTabIndex == 1) ...[
                    const Positioned.fill(
                      child: RouteSection(),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper: Modal Header ---
  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ride Details',
              style: AppTextStyles.pageHeaderTitle, 
            ),
            const SizedBox(height: 2), 
            Text(
              widget.rideId, 
              style: AppTextStyles.pageHeaderSubtitle.copyWith(
                fontWeight: FontWeight.w600, 
                color: const Color(0xFF637381), 
              ),
            ),
          ],
        ),
        
        IconButton(
          onPressed: () => Navigator.of(context).pop(), 
          icon: const Icon(Icons.close, color: Color(0xFF1E272E)),
          splashRadius: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(), 
        ),
      ],
    );
  }
}