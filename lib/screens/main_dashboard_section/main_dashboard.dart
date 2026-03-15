import 'package:carpool_admin/widgets/cards/dashboard_stat_card.dart';
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
                          crossAxisSpacing: 280,
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
          ],
        ),
      ),
    );
  }
}