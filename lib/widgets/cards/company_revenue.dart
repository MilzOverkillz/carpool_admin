import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/cards/payment_row.dart';
import 'package:flutter/material.dart';

class CompanyRevenue extends StatefulWidget {
  const CompanyRevenue({super.key});

  @override
  State<CompanyRevenue> createState() => _CompanyRevenueState();
}

class _CompanyRevenueState extends State<CompanyRevenue> {
  final List<Map<String, String>> companies = [
    {
      "company": "Tech Corp Inc",
      "totalRevenue": "\$105.55",
      "totalRides": "798",
      "avgFare": "\$601.13",
    },
    {
      "company": "Healthcare plus",
      "totalRevenue": "\$446.61",
      "totalRides": "130",
      "avgFare": "\$219.78",
    },
    {
      "company": "Finance Solution",
      "totalRevenue": "\$202.87",
      "totalRides": "647",
      "avgFare": "\$854.08",
    },
    {
      "company": "Design Studio Ltd",
      "totalRevenue": "\$576.28",
      "totalRides": "556",
      "avgFare": "\$396.84",
    },
    {
      "company": "Tech Corp Inc",
      "totalRevenue": "\$948.55",
      "totalRides": "826",
      "avgFare": "\$446.61",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Container(
        width: double.infinity,
        height: 380,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Company Based Revenue",
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Color(0xFF212B36),
                    ),
                  ),
                  Text(
                    "Revenue breakdown by company",
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                      color: Color(0xFF9EA2A5),
                    ),
                  ),
                ],
              ),
            ),
            const PaymentTableRow(),
            SizedBox(height: 19,),
            tableHeader(),
            const SizedBox(height: 3),
            const Divider(height: 0, thickness: 1, color: Color(0xFFF4F4F5)),
            Expanded(
              child: ListView.builder(
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  final item = companies[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 106, 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item["company"] ?? "",
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        SizedBox(
                          width: 200,
                          child: Center(
                            child: Text(
                              item["totalRevenue"] ?? "",
                              style: AppTextStyles.paymentRow,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text(
                              item["totalRides"] ?? "",
                              style: AppTextStyles.paymentRow,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 160,
                          child: Center(
                            child: Text(
                              item["avgFare"] ?? "",
                              style: AppTextStyles.paymentRow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 106),
      child: Row(
        children: [
          Expanded(child: Text("COMPANY", style: AppTextStyles.paymentHeader)),

          SizedBox(
            width: 200,
            child: Center(
              child: Text("TOTAL REVENUE", style: AppTextStyles.paymentHeader),
            ),
          ),

          Expanded(
            child: Center(
              child: Text("TOTAL RIDES", style: AppTextStyles.paymentHeader),
            ),
          ),

          SizedBox(
            width: 160,
            child: Center(
              child: Text("AVG FARE", style: AppTextStyles.paymentHeader),
            ),
          ),
        ],
      ),
    );
  }
}
