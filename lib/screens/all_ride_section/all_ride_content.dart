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
        rideId: 'RD-2025-002',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Scheduled',
        fare: 'RS 1,200',
      ),
      _Ride(
        rideId: 'RD-2025-003',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Scheduled',
        fare: 'RS 1,200',
      ),
      _Ride(
        rideId: 'RD-2025-004',
        driver: 'John Smith',
        riders: '4',
        date: '2025-09-23',
        status: 'Completed',
        fare: 'RS 1,200',
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 32, bottom: 360, top: 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05000000),
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
                fontSize: 20,
                fontWeight: AppFonts.bold,
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'View all rides from your company employee',
              style: AppTextStyles.caption.copyWith(
                color: const Color(0xFFA0AEC0),
              ),
            ),
            const SizedBox(height: 20),

            // Header row
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  _headerCell('Rider ID', flex: 2),
                  _headerCell('Driver', flex: 2),
                  _headerCell('Riders', flex: 1),
                  _headerCell('Date', flex: 2),
                  _headerCell('Status', flex: 2),
                  _headerCell('Fare', flex: 2),
                ],
              ),
            ),

            const Divider(height: 1, color: Color(0xFFEAEAEA)),

            ...rides.map((ride) => _RideRow(ride: ride)),
          ],
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
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: Color(0xFF9CA3AF),
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _cell(ride.rideId)),
          Expanded(flex: 2, child: _cell(ride.driver)),
          Expanded(flex: 1, child: _cell(ride.riders)),
          Expanded(flex: 2, child: _cell(ride.date)),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _statusPill(ride.status),
            ),
          ),
          Expanded(flex: 2, child: _cell(ride.fare)),
        ],
      ),
    );
  }

  Widget _cell(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppFonts.primary,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF111827),
      ),
    );
  }

  Widget _statusPill(String status) {
    final bool isCompleted = status == 'Completed';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isCompleted ? const Color(0xFFD9D9D9) : const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }
}

// ── Data Model ────────────────────────────────────────────────────────────────

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
