import 'package:flutter/material.dart';
import '../../utils/theme/text_styles.dart';
import '../nav_bar/ride_details_tab_bar.dart';
import 'details_section.dart';
import 'route_section.dart'; 
import 'participants_section.dart'; // <--- IMPORT THE NEW FILE
import 'payments_section.dart'; // <--- IMPORT THE PAYMENTS SECTION
import 'ratings_section.dart'; // <--- IMPORT THE RATINGS SECTION

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
        width: 518, 
        height: 500, 
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

            Expanded(
              child: Stack(
                children: [
                  // Tab 0: Details
                  if (_selectedTabIndex == 0) ...[
                    const Positioned.fill(
                      child: DetailsSection(
                        rideStatus: 'completed', 
                        paymentStatus: 'Paid',
                      ),
                    ),
                  ],

                  // Tab 1: Route
                  if (_selectedTabIndex == 1) ...[
                    const Positioned.fill(
                      child: RouteSection(),
                    ),
                  ],

                  // Tab 2: Participants (THE NEW SECTION!)
                  if (_selectedTabIndex == 2) ...[
                    const Positioned.fill(
                      child: ParticipantsSection(),
                    ),
                  ],

                  if (_selectedTabIndex == 3) ...[
                    const Positioned.fill(
                      child: PaymentsSection(), // <--- 2. ADD THIS BLOCK
                    ),
                  ],

                  if (_selectedTabIndex == 4) ...[
                    const Positioned.fill(
                      child: RatingsSection(), // <--- 2. ADD THIS BLOCK
                    ),
                  ],
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