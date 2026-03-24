import 'package:flutter/material.dart';

import '../../utils/theme/fonts.dart';
import '../../utils/theme/text_styles.dart';

class AllRideContent extends StatelessWidget {
  const AllRideContent({super.key});

  @override
  Widget build(BuildContext context) {
    final rides = const [
      _Ride(
        rideId: 'RD-2025-001',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Completed',
        fare: 'RS 1,200',
      ),
      _Ride(
        rideId: 'RD-2025-001',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Scheduled',
        fare: 'RS 1,200',
      ),
      _Ride(
        rideId: 'RD-2025-001',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Scheduled',
        fare: 'RS 1,200',
      ),
      _Ride(
        rideId: 'RD-2025-001',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Completed',
        fare: 'RS 1,200',
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(28, 18, 28, 28),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
          decoration: BoxDecoration(
            color: const Color(0xFFFDFDFD),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Rides',
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 14,
                  fontWeight: AppFonts.bold,
                  color: const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'View all rides from your company employee',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 9,
                  color: const Color(0xFFA0AEC0),
                ),
              ),
              const SizedBox(height: 14),

              // Header
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                child: Row(
                  children: [
                    _headerCell('Rider ID', flex: 2),
                    _headerCell('Driver', flex: 2),
                    _headerCell('Riders', flex: 1),
                    _headerCell('Date', flex: 2),
                    _headerCell('Status', flex: 1),
                    _headerCell('Fare', flex: 1),
                  ],
                ),
              ),

              const Divider(
                height: 1,
                thickness: 0.8,
                color: Color(0xFFEAEAEA),
              ),

              ...rides.map((ride) => _RideRow(ride: ride)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6B7280),
        ),
      ),
    );
  }
}

class _RideRow extends StatelessWidget {
  final _Ride ride;

  const _RideRow({required this.ride});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              ride.rideId,
              style: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ride.driver,
              style: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ride.riders,
              style: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ride.date,
              style: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _statusPill(ride.status),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ride.fare,
              style: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusPill(String status) {
    final bool isCompleted = status == 'Completed';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted ? const Color(0xFFD9D9D9) : const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 8.5,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }
}

class _Ride {
  final String rideId;
  final String driver;
  final String riders;
  final String date;
  final String status;
  final String fare;

  const _Ride({
    required this.rideId,
    required this.driver,
    required this.riders,
    required this.date,
    required this.status,
    required this.fare,
  });
}
