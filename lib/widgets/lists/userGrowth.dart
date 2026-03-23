import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class UserGrowth extends StatelessWidget {
  const UserGrowth({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Lists
    final List<String> statTitles = [
      'Average Trip Duration',
      'Average Trip Distance',
      'Driver Utilization',
    ];
    final List<String> statSubtitles = [
      'Across all rides',
      'Across all rides',
      'Active drivers vs total',
    ];
    final List<String> statValues = ['24 min', '12.8 Km', '78%'];
    final List<String> statTrends = [
      '2 min from last month',
      '0.5 km from last month',
      '380 of 485 drivers active',
    ];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < statTitles.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statTitles[i],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                        Text(
                          statSubtitles[i],
                          style: const TextStyle(
                            color: Color(0xFFA3AED0),
                            fontSize: 11,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statValues[i],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                        Text(
                          statTrends[i],
                          style: const TextStyle(
                            color: Color(0xFFA3AED0),
                            fontSize: 11,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
