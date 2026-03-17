import 'package:carpool_admin/widgets/cards/dashboard_stat_card.dart';
import 'package:carpool_admin/widgets/charts/dashboard_bar_chart.dart';
import 'package:carpool_admin/widgets/charts/monthly_revenue_chart.dart';
import 'package:carpool_admin/widgets/charts/user_distribution_chart.dart';
import 'package:carpool_admin/widgets/layout/main_layout.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        "title": "Active Companies",
        "value": "42",
        "change": "+12%",
        "iconPath": "assets/icons/dashboard/company.svg",
      },
      {
        "title": "Total Users",
        "value": "128",
        "change": "+5%",
        "iconPath": "assets/icons/dashboard/users.svg",
      },
      {
        "title": "Active Rides",
        "value": "3,420",
        "change": "+18%",
        "iconPath": "assets/icons/dashboard/rides.svg",
      },
      {
        "title": "Pending Request",
        "value": "3,420",
        "change": "+18%",
        "iconPath": "assets/icons/dashboard/pending.svg",
      },
      {
        "title": "Total Revenue",
        "value": "3,420",
        "change": "+18%",
        "iconPath": "assets/icons/dashboard/revenue.svg",
      },
      {
        "title": "Refund Requests",
        "value": "3,420",
        "change": "+18%",
        "iconPath": "assets/icons/dashboard/refund.svg",
      },
    ];

    return MainLayout(
      pageTitle: 'Dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 270,
              child: Container(
                padding: const EdgeInsets.only(left: 23, right: 73),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 260,
                              mainAxisSpacing: 27,
                              childAspectRatio: 2.2,
                            ),
                        itemCount: stats.length,
                        itemBuilder: (context, index) {
                          final stat = stats[index];

                          return DashboardStatCard(
                            title: stat["title"]!,
                            value: stat["value"]!,
                            change: stat["change"]!,
                            iconPath: stat["iconPath"]!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 29),
            Row(
              children: [
                DashboardBarChart(
                  title: "Rides Per Day",
                  subtitle: "Last 7 days activity",
                  labels: const [
                    "Mon",
                    "Tue",
                    "Wed",
                    "Thu",
                    "Fri",
                    "Sat",
                    "Sun",
                  ],
                  values: const [260, 200, 410, 130, 220, 60, 160],
                ),
                Spacer(),
                UsersDistributionChart(
                  title: 'User Distribution',
                  subtitle: 'Drivers vs Riders',
                  period: 'Monthly',
                  ridersPercent: 65.0,
                  driversPercent: 35.0,
                ),
              ],
            ),
            const SizedBox(height: 30),
            MonthlyRevenueChart(
  year2020: [
    10000, 18000, 17000, 20000, 30000, 38000,
    28000, 19000, 20000, 23000, 24000, 23000
  ],
  year2021: [
    22000, 29000, 11000, 26000, 36000, 21000,
    30000, 36000, 26000, 15000, 32000, 36000
  ],
)
          ],
        ),
      ),
    );
  }
}
