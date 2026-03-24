import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/cards/dashboard_stat_card.dart';
import 'package:carpool_admin/widgets/cards/data_table_card.dart';
import 'package:carpool_admin/widgets/charts/dashboard_bar_chart.dart';
import 'package:carpool_admin/widgets/charts/monthly_revenue_chart.dart';
import 'package:flutter/material.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> recentRidesData = [
  {
    "id": "RD-2025-001",
    "driver": "John Smith",
    "riderCount": 4,
    "date": "2025-09-23",
    "status": "Completed",
    "fare": "1,200",
  },
  {
    "id": "RD-2025-002",
    "driver": "Sarah Williams",
    "riderCount": 2,
    "date": "2025-09-24",
    "status": "Scheduled",
    "fare": "1,200",
  },
  {
    "id": "RD-2025-003",
    "driver": "Michael Chen",
    "riderCount": 3,
    "date": "2025-09-24",
    "status": "In Progress",
    "fare": "1,200",
  },
  {
    "id": "RD-2025-004",
    "driver": "John Smith",
    "riderCount": 1,
    "date": "2025-09-25",
    "status": "Cancelled",
    "fare": "1,200",
  },
  {
    "id": "RD-2025-005",
    "driver": "Emily Davis",
    "riderCount": 4,
    "date": "2025-09-25",
    "status": "Completed",
    "fare": "1,200",
  },
];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 196),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashboardStatCard(
                  title: 'Total Users',
                  value: '1284',
                  change: '+8%',
                  iconPath: 'assets/icons/dashboard/users.svg',
                ),
                DashboardStatCard(
                  title: 'Active Rides',
                  value: '34',
                  change: '+8%',
                  iconPath: 'assets/icons/dashboard/rides.svg',
                ),
                DashboardStatCard(
                  title: 'Monthly Spend',
                  value: '1284',
                  change: '+8%',
                  iconPath: 'assets/icons/dashboard/revenue.svg',
                ),
                DashboardStatCard(
                  title: 'Avg /Cost Ride Users',
                  value: '\$12.84',
                  change: 'stable',
                  iconPath: 'assets/icons/dashboard/refund.svg',
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
          Container(
            margin: EdgeInsets.only(right: 156),
            child: DashboardBarChart(
              width: 1475,
              height: 360,
              title: "Rides Per Day",
              subtitle: "Last 7 days activity",
              labels: const ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
              values: const [260, 200, 410, 130, 220, 60, 160],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: EdgeInsets.only(right: 156),
            child: MonthlyRevenueChart(
              year2020: [
                10000,
                18000,
                19000,
                20000,
                22000,
                38753,
                28000,
                19000,
                20000,
                12657,
                22000,
                24000,
              ],
              year2021: [], // empty = second line hidden
              title: "Monthly Cost",
              subtitle: "Ride activity over",
              showLegend: false,
              primaryDotIndex: 5,
              secondaryDotIndex: 9,
              showDashedVerticals: true,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: EdgeInsets.only(right: 156),
            child: DataTableCard(
              title: "Recent Rides",
              data: recentRidesData,
              customHeaderLabels: ["Rider ID", "Driver", "Riders", "Date", "Status", "Fare"],
              columnFlex: [3, 3, 2, 3, 3, 2],
              rowBuilder: (context, ride) {
  return Row(
    children: [
      // 1. Rider ID
      Expanded(
        flex: 3, 
        child: Text(ride['id'], style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),)
      ),
      // 2. Driver
      Expanded(
        flex: 3, 
        child: Text(ride['driver'], style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),)
      ),
      // 3. Riders (Centered)
      Expanded(
        flex: 2, 
        child: Center(
          child: Text(ride['riderCount'].toString(), style: const TextStyle(fontWeight: FontWeight.w700))
        )
      ),
      // 4. Date (Alignment must match header)
      Expanded(
        flex: 3, 
        child: Text(
          ride['date'], 
          style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),
        )
      ),
      // 5. Status (Wrapped in Align to stay left-aligned within its flex block)
      Expanded(
        flex: 3, 
        child: Align(
          alignment: Alignment.centerLeft, 
          child: _buildStatusBadge(ride['status'])
        )
      ),
      // 6. Fare (Right-aligned to match design edge)
      Expanded(
        flex: 2, 
        child: Text(
          "\$ ${ride['fare']}", 
          textAlign: TextAlign.right, 
          style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),
        )
      ),
    ],
  );
},
            ),
          ),
const SizedBox(height: 43),
        ],
      ),
    );
  }
}


Widget _buildStatusBadge(String status) {
  return Container(
    width: 76,
    height: 24,
    decoration: BoxDecoration(
      color: const Color(0xFFC7C9CB), // Light grey background from your design
      borderRadius: BorderRadius.circular(10),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        status,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFF1e272e), // Slate grey text
        ),
      ),
    ),
  );
}