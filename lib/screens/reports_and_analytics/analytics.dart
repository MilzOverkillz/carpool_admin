import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/charts/peak_hours.dart';
import 'package:carpool_admin/widgets/charts/revenue_chart.dart';
import 'package:carpool_admin/widgets/charts/user_growth_chart.dart';
import 'package:carpool_admin/widgets/lists/userGrowth.dart';
import 'package:carpool_admin/widgets/notifications_widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              _buildStatsCards(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Revenue & Ride Trend',
                                      style: AppTextStyles.statesCardValue
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      'Monthly performance over 7 months',
                                      style: TextStyle(
                                        fontFamily: AppFonts.dmSans,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFA3AED0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Company Performance',
                                      style: AppTextStyles.statesCardValue
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      'Top 5 companies by ride count',
                                      style: TextStyle(
                                        fontFamily: AppFonts.dmSans,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFA3AED0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 30,
                          ),
                          child: Row(
                            children: [
                              RevenueRidesChart(),
                              const SizedBox(width: 40),
                              ContactList(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Growth',
                                    style: AppTextStyles.statesCardValue
                                        .copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    'Driver vs Rider growth over 4 weeks',
                                    style: TextStyle(
                                      fontFamily: AppFonts.dmSans,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA3AED0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 30,
                            left: 30,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [UserGrowthChart(), UserGrowth()],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Peak Hours Analysis',
                                    style: AppTextStyles.statesCardValue
                                        .copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    'Ride distribution throughout the day',
                                    style: TextStyle(
                                      fontFamily: AppFonts.dmSans,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA3AED0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        PeakHoursChart(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStatsCards() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      final crossAxisCount = width > 1100 ? 4 : 2;
      final spacing = 16.0;
      final itemWidth =
          (constraints.maxWidth - (spacing * (crossAxisCount - 1))) /
          crossAxisCount;

      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [
          SizedBox(
            width: itemWidth,
            child: StatsCard(
              label: 'Total Users',
              value: '1284',
              persentage: Row(
                children: [
                  SizedBox(
                    height: 14,
                    child: SvgPicture.asset('assets/icons/analytics/up.svg'),
                  ),
                  const SizedBox(width: 4),
                  Text('+12%'),
                ],
              ),
              iconAsset: 'assets/icons/analytics/users.svg',
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: StatsCard(
              label: 'Top Riders',
              value: '4752',
              persentage: Row(
                children: [
                  SvgPicture.asset('assets/icons/analytics/down.svg'),
                  const SizedBox(width: 4),
                  Text('+8.3%'),
                ],
              ),
              iconAsset: 'assets/icons/analytics/ancar.svg',
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: StatsCard(
              label: 'Total Revenue',
              value: '12,450',
              persentage: Text('+15.2%'),
              iconAsset: 'assets/icons/analytics/doller.svg',
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: StatsCard(
              label: 'Avg Ride Value',
              value: '\$26.52',
              persentage: Text('+4.7%'),
              iconAsset: 'assets/icons/analytics/up.svg',
            ),
          ),
        ],
      );
    },
  );
}

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titleList = [
      'Tech Corp Inc',
      'Healthcare Plus',
      'Finance Solution',
      'Design studio Pvt',
      'Ratal Group',
      'Ratal Group',
    ];

    final List<String> subtitleList = [
      '342 rides  \$8 425  revenue',
      '59 minutes ago',
      '12 hours ago',
      'Today, 11:59 AM',
      'Feb 2, 2025',
      'Feb 2, 2025',
    ];

    final List<String> rateList = ['4.5', '4.5', '4.5', '4.5', '4.5', '4.5'];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < titleList.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Leading: CircleAvatar
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black.withOpacity(0.4),
                    ),
                    const SizedBox(width: 12),

                    // Title and Subtitle Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleList[i],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: AppFonts.primary,
                            ),
                          ),
                          Text(
                            subtitleList[i],
                            style: TextStyle(
                              color: Color(0xFF000000).withOpacity(0.4),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Trailing: Rate
                    Row(
                      children: [
                        const Icon(Icons.star, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          rateList[i],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
