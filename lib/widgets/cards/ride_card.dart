import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';
import 'ride_dialog.dart';

class RideCardWidget extends StatelessWidget {
  final String rideId;
  final String company;
  final String driverName;
  final String rating;
  final List<String> riders; 
  final String routeStart;
  final String routeEnd;
  final String distance;
  final String date;
  final String time;
  final String fair;
  final String status;
  final String payment;

  const RideCardWidget({
    Key? key,
    required this.rideId,
    required this.company,
    required this.driverName,
    required this.rating,
    required this.riders,
    required this.routeStart,
    required this.routeEnd,
    required this.distance,
    required this.date,
    required this.time,
    required this.fair,
    required this.status,
    required this.payment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryStyle = AppTextStyles.bodySmall.copyWith(
      fontWeight: FontWeight.w700, 
      fontSize: 12,
      color: const Color(0xFF1E272E), 
      letterSpacing: -0.24, 
    );

    final secondaryStyle = AppTextStyles.pageHeaderSubtitle.copyWith(
      color: const Color(0xFFC7C9CB), 
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        children: [
          // 1. RIDE ID Column
          Expanded(
            flex: 4, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rideId, style: primaryStyle),
                Text(company, style: secondaryStyle),
              ],
            ),
          ),

          // 2. DRIVER Column
          Expanded(
            flex: 4, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driverName, style: primaryStyle),
                Row(
                  children: [
                    const Icon(Icons.star, size: 13, color: Color(0xFF1E272E)),
                    const SizedBox(width: 4),
                    Text(rating, style: secondaryStyle),
                  ],
                ),
              ],
            ),
          ),

          // 3. RIDERS Column 
          Expanded(
            flex: 3, 
            child: Transform.translate(
              offset: const Offset(-12, 0), 
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: riders.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final String initials = entry.value;
                    final bool isLast = index == riders.length - 1;

                    return Align(
                      widthFactor: isLast ? 1.0 : 0.65, 
                      alignment: Alignment.centerLeft,
                      child: _buildRiderAvatar(initials), 
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // 4. ROUTE Column (FIXED: Reverted back to original position)
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(routeStart, style: primaryStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        'assets/icons/arrow_right.png', 
                        width: 8,
                        height: 8,
                        color: const Color(0xFF1E272E), 
                      ),
                    ),
                    Text(routeEnd, style: primaryStyle),
                  ],
                ),
                Text(distance, style: secondaryStyle),
              ],
            ),
          ),

          // 5. DATE & TIME Column
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: primaryStyle),
                Text(time, style: secondaryStyle),
              ],
            ),
          ),

          // 6. FAIR Column
          Expanded(
            flex: 2,
            child: Text(fair, style: primaryStyle),
          ),

          // 7. STATUS Column
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildStatusPill(status), 
            ),
          ),

          // 8. PAYMENT Column
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPaymentPill(payment), 
            ),
          ),

          // 9. ACTIONS Column 
          Expanded(
            flex: 2, 
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RideDetailsDialog(rideId: rideId);
                    },
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0), 
                  child: Image.asset(
                    'assets/icons/eye.png', 
                    width: 16,
                    height: 16,
                    color: const Color(0xFF1E272E),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper: Rider Avatar ---
  Widget _buildRiderAvatar(String initials) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFF74797D), 
        borderRadius: BorderRadius.circular(10), 
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // --- Helper 1: Status Pill (FIXED UNIFORM SIZE) ---
  Widget _buildStatusPill(String text) {
    return Container(
      width: 80, 
      height: 22, 
      decoration: BoxDecoration(
        color: AppColors.barFillGrey, 
        borderRadius: BorderRadius.circular(10), 
      ),
      alignment: Alignment.center, 
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.clip, 
        style: const TextStyle(
          fontFamily: 'DMSans',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Color(0xFF495056), 
        ),
      ),
    );
  }

  // --- Helper 2: Payment Pill (HUGS TEXT) ---
  Widget _buildPaymentPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12), 
      height: 22, 
      decoration: BoxDecoration(
        color: AppColors.barFillGrey, 
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'DMSans',
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF495056), 
            ),
          ),
        ],
      ),
    );
  }
}