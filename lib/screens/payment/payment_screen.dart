import 'package:carpool_admin/utils/providers/payment_provider.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:carpool_admin/widgets/cards/payment_status.dart';
import 'package:carpool_admin/widgets/cards/payment_status2.dart';
import 'package:carpool_admin/widgets/cards/payment_transactions_table_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carpool_admin/utils/theme/colors.dart';

class PayemntScreen extends StatelessWidget {
  const PayemntScreen({super.key});

  final List<String> _tabs = const [
    "Transaction",
    "Refund Requests",
    "Company Revenue",
  ];

  final List<int?> _tabCounts = const [null, 2, null];

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex = context.watch<PaymentProvider>().selectedTabIndex;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Color(0xFFF4F7FE)),
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 45),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    blurRadius: 4.2,
                    spreadRadius: 0,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 10),
                    child: Image.asset("assets/icons/payment/bx_error.png"),
                  ),
                  Text(
                    "2 Refund request pending review",
                    style: TextStyle(
                      color: AppColors.paymentText,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: AppFonts.primary,
                    ),
                  ),
                ],
              ),
            ),
            _buildStatusCards(selectedTabIndex),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payments & Refunds",
                      style: TextStyle(
                        color: Color(0xFF212B36),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: AppFonts.primary,
                      ),
                    ),
                    Text(
                      "Monitor all payment transactions and refund requests",
                      style: TextStyle(
                        color: Color(0xFF9EA2A5),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: AppFonts.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 169,
                      height: 38,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Color(0xFFD9D9D9),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset("assets/icons/payment/buttonicon1.png"),
                            SizedBox(width: 15),
                            Text(
                              "Process Refund",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: AppFonts.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 29),
                    SizedBox(
                      width: 169,
                      height: 38,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Color(0xFFD9D9D9),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset("assets/icons/payment/buttonicon2.png"),
                            SizedBox(width: 10),
                            Text(
                              "Payment Setting",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: AppFonts.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 28),
            Container(
              width: double.infinity,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFE1E1E1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Row(
                  children: List.generate(
                    _tabs.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            context.read<PaymentProvider>().changeTab(index),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: selectedTabIndex == index
                                ? AppColors.surface
                                : Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _tabs[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: selectedTabIndex == index
                                      ? FontWeight.w700
                                      : FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: AppFonts.primary,
                                ),
                              ),
                              if (_tabCounts[index] != null) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    _tabCounts[index].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10,
                                      fontFamily: AppFonts.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            PaymentTransactionsTableCard()
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCards(int index) {
    switch (index) {
      case 0:
        return PaymentStatus();
      case 1 || 2:
        return PaymentStatus2();
      default:
        return SizedBox();
    }
  }
}
