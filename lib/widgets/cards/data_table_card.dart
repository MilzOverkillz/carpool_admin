import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class DataTableCard extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  // New properties for reusability
  final List<String>? customHeaderLabels;
  final List<int>? columnFlex;
  final Widget Function(BuildContext, Map<String, dynamic>)? rowBuilder;

  const DataTableCard({
    super.key,
    required this.title,
    required this.data,
    this.customHeaderLabels,
    this.columnFlex,
    this.rowBuilder,
  });

  @override
  Widget build(BuildContext context) {
    // Default headers if none provided (keeps PopularRoutes working)
    final headers = customHeaderLabels ?? ["Route", "No Of Rides", "Earn"];

    return Container(
      padding: const EdgeInsets.only(right: 92, left: 31, top: 19, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.02,
              color: Color(0xFF1D1D1D),
            ),
          ),
          const SizedBox(height: 20),

          /// HEADER
          Row(
            children: List.generate(headers.length, (index) {
              // Determine alignment based on column name
              TextAlign alignment = TextAlign.start;
              if (headers[index] == "Riders") alignment = TextAlign.center;
              if (headers[index] == "Fare") alignment = TextAlign.right;

              return Expanded(
                flex: columnFlex != null ? columnFlex![index] : 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    headers[index],
                    textAlign: alignment,
                    style: const TextStyle(
                      color: Color(0xff666666),
                      fontFamily: AppFonts.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xffe9edf7)),
          ),

          /// DATA ROWS
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              // Use custom builder if provided, otherwise use default Route style
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: rowBuilder != null
                    ? rowBuilder!(context, item)
                    : _buildDefaultRouteRow(item),
              );
            },
          ),
        ],
      ),
    );
  }

  // Maintains your original "Popular Routes" logic
  Widget _buildDefaultRouteRow(Map<String, dynamic> item) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item['route'] ?? "",
            style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),
          ),
        ),
        Expanded(child: Text(item['rides']?.toString() ?? "0", style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),)),
        Expanded(child: Text("\$ ${item['earn'] ?? "0"}", style: const TextStyle(fontFamily: AppFonts.primary, fontSize: 14, letterSpacing: -0.02, fontWeight: FontWeight.w700, color: Color(0xff1d1d1d)),)),
      ],
    );
  }
}
