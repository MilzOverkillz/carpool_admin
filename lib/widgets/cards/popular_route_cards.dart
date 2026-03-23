import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PopularRoutesCard extends StatelessWidget {
  final List<Map<String, dynamic>> routes;

  const PopularRoutesCard({super.key, required this.routes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Routes",
            style: AppTextStyles.cardHeader
          ),

          const SizedBox(height: 20),

          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(child: Text("Route", style: AppTextStyles.dashboardTableHeader,)),
              Expanded(child: Text("No Of Rides", style: AppTextStyles.dashboardTableHeader,)),
              Expanded(child: Text("Earn", style: AppTextStyles.dashboardTableHeader,)),
            ],
          ),

          const Divider(color: Color(0xffE9EDF7),),

          /// DATA
          ...routes.map((route) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(route['route'], style: AppTextStyles.routeText,)),
                  Expanded(child: Text(route['rides'].toString(), style: AppTextStyles.routeText2,)),
                  Expanded(child: Text("\$ ${route['earn']}", style: AppTextStyles.routeText2,)),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}