import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/text_styles.dart'; 

import '../../widgets/cards/alert_banner.dart'; 
import '../../widgets/cards/rides_filter_bar.dart'; 
import '../../widgets/Cards/ride_card.dart'; 

class RidesContent extends StatefulWidget {
  const RidesContent({Key? key}) : super(key: key);

  @override
  State<RidesContent> createState() => _RidesContentState();
}

class _RidesContentState extends State<RidesContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        bottom: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(),
          const SizedBox(height: 24), 
          
          const AlertBannerWidget(),
          
          const SizedBox(height: 24), 
          
          _buildMainContentCard(),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rides Management',
          style: AppTextStyles.pageHeaderTitle, 
        ),
        const SizedBox(height: 4),
        const Text(
          'Monitor and manage all carpool rides',
          style: AppTextStyles.pageHeaderSubtitle, 
        ),
      ],
    );
  }

  Widget _buildMainContentCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface, 
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow, 
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const RidesFilterBar(), 
          const Divider(height: 1, color: AppColors.divider),
          _buildDataTable(), 
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return Column(
      children: [
        // --- TABLE HEADERS (Updated Flex values) ---
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              _buildTableHeader('RIDE ID', flex: 4, align: Alignment.centerLeft),
              _buildTableHeader('DRIVER', flex: 4, align: Alignment.centerLeft),
              _buildTableHeader('RIDERS', flex: 3, align: Alignment.centerLeft),
              _buildTableHeader('ROUTE', flex: 5, align: Alignment.centerLeft),
              _buildTableHeader('DATE & TIME', flex: 4, align: Alignment.centerLeft),
              _buildTableHeader('FAIR', flex: 2, align: Alignment.centerLeft),
              _buildTableHeader('STATUS', flex: 3, align: Alignment.centerLeft),
              _buildTableHeader('PAYMENT', flex: 3, align: Alignment.centerLeft),
              _buildTableHeader('ACTIONS', flex: 2, align: Alignment.center),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.divider),

        // --- TABLE ROWS ---
        const RideCardWidget(
          rideId: 'RD-2025-001',
          company: 'Tech Corp Inc',
          driverName: 'John Smith',
          rating: '4.8',
          riders: ['JS', 'JS', 'JS'],
          routeStart: 'Down Town',
          routeEnd: 'Tech Park',
          distance: '125 KM',
          date: '2025-01-28',
          time: '8.00 AM',
          fair: '\$24.50',
          status: 'Completed',
          payment: 'Paid',
        ),
        const Divider(height: 1, color: Color(0xFFF3F4F6)), 
        
        const RideCardWidget(
          rideId: 'RD-2025-002',
          company: 'Design Studio Ltd',
          driverName: 'John Smith',
          rating: '4.8',
          riders: ['JS', 'JS', 'JS'],
          routeStart: 'Down Town',
          routeEnd: 'Tech Park',
          distance: '125 KM',
          date: '2025-01-28',
          time: '8.00 AM',
          fair: '\$24.50',
          status: 'Cancelled',
          payment: 'Pending',
        ),
        const Divider(height: 1, color: Color(0xFFF3F4F6)),
        
        const RideCardWidget(
          rideId: 'RD-2025-003',
          company: 'Healthcare Pvt',
          driverName: 'John Smith',
          rating: '4.8',
          riders: ['JS', 'JS', 'JS'],
          routeStart: 'Down Town',
          routeEnd: 'Tech Park',
          distance: '125 KM',
          date: '2025-01-28',
          time: '8.00 AM',
          fair: '\$24.50',
          status: 'Scheduled',
          payment: 'Refunded',
        ),
        const Divider(height: 1, color: Color(0xFFF3F4F6)),

        const RideCardWidget(
          rideId: 'RD-2025-004',
          company: 'Retail Group',
          driverName: 'John Smith',
          rating: '4.8',
          riders: ['JS', 'JS', 'JS'],
          routeStart: 'Down Town',
          routeEnd: 'Tech Park',
          distance: '125 KM',
          date: '2025-01-28',
          time: '8.00 AM',
          fair: '\$24.50',
          status: 'Active',
          payment: 'Paid',
        ),
        const Divider(height: 1, color: Color(0xFFF3F4F6)),

        const RideCardWidget(
          rideId: 'RD-2025-005',
          company: 'Tech Corp Inc',
          driverName: 'John Smith',
          rating: '4.8',
          riders: ['JS', 'JS', 'JS'],
          routeStart: 'Down Town',
          routeEnd: 'Tech Park',
          distance: '125 KM',
          date: '2025-01-28',
          time: '8.00 AM',
          fair: '\$24.50',
          status: 'Flagged',
          payment: 'Paid',
        ),
        const Divider(height: 1, color: Color(0xFFF3F4F6)),

        const RideCardWidget(
          rideId: 'RD-2025-006',
          company: 'Tech Corp Inc',
          driverName: 'John Smith',
          rating: '4.8',
          riders: ['JS', 'JS', 'JS'],
          routeStart: 'Down Town',
          routeEnd: 'Tech Park',
          distance: '125 KM',
          date: '2025-01-28',
          time: '8.00 AM',
          fair: '\$24.50',
          status: 'Completed',
          payment: 'Paid',
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTableHeader(String text, {required int flex, required Alignment align}) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: align,
        child: Text(
          text,
          style: AppTextStyles.tableHeader.copyWith(
            color: const Color(0xFFC7C9CB), 
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}