import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class BestDriversCard extends StatelessWidget {
  final List<Map<String, dynamic>> drivers;

  const BestDriversCard({super.key, required this.drivers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Drivers",
            style: AppTextStyles.cardHeader
          ),

          const SizedBox(height: 20),

          /// HEADER
          Row(
            children:  [
              Expanded(flex: 2, child: Text("Name", style: AppTextStyles.dashboardTableHeader,)),
              Expanded(child: Text("Route", style: AppTextStyles.dashboardTableHeader,)),
              Expanded(child: Text("No Of Rides", style: AppTextStyles.dashboardTableHeader,)),
            ],
          ),

          const Divider(),

          /// LIST
Expanded(
  child: ListView.builder(
    itemCount: drivers.length,
    itemBuilder: (context, index) {
      final driver = drivers[index];

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            /// PROFILE
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff495056)),
                    child: Align(alignment: Alignment.center, child: Text('JS', style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w700, fontSize: 14, letterSpacing: -0.02, color: AppColors.white),)),
                  ),
                  SizedBox(width: 8,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driver['name'],
                          style: const TextStyle(fontWeight: FontWeight.w700, fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, color: Color(0xff495056)),
                        ),
                        Text(
                          driver['email'],
                          style: const TextStyle(fontWeight: FontWeight.w400, fontFamily: AppFonts.dmSans, fontSize: 12, letterSpacing: -0.02, color: Color(0xff9ea2a5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Expanded(child: Text(driver['route'], style: AppTextStyles.routeText,)),
            Expanded(child: Text(driver['rides'].toString(), style: AppTextStyles.routeText2,)),
          ],
        ),
      );
    },
  ),
)
        ],
      ),
    );
  }
}