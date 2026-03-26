import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class PaymentStatus extends StatelessWidget {
  const PaymentStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Row(
        children: [
          _PaymentStatusCard(
            title: "Total Driver Earnings",
            value: "\$ 66.50",
            iconPath: "assets/icons/payment/icon1.png",
            bottomContent: Row(
              children: [
                Image.asset("assets/icons/payment/subicon1.png"),
                SizedBox(width: 7),
                Text(
                  "+8%",
                  style: TextStyle(
                    color: Color(0xFF636363),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    fontFamily: AppFonts.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          _PaymentStatusCard(
            title: "Total Commisioned Earned",
            value: "\$ 12.50",
            iconPath: "assets/icons/payment/icon2.png",
            rightPadding: 13,
            bottomContent: Row(
              children: [
                Image.asset("assets/icons/payment/subicon2.png"),
                SizedBox(width: 7),
                Text(
                  "+8%",
                  style: TextStyle(
                    color: Color(0xFF636363),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    fontFamily: AppFonts.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          _PaymentStatusCard(
            title: "Pending Payments",
            value: "1",
            iconPath: "assets/icons/payment/icon3.png",
            bottomContent: Text(
              "Requires Attention",
              style: TextStyle(
                color: Color(0xFF636363),
                fontWeight: FontWeight.w700,
                fontSize: 12,
                fontFamily: AppFonts.primary,
              ),
            ),
          ),
          SizedBox(width: 10),
          _PaymentStatusCard(
            title: "Gateway Status",
            value: "Completed",
            iconPath: "assets/icons/payment/icon4.png",
            valueFontSize: 14,
            topSpacingBeforeValue: 6,
            bottomContent: Text(
              "Stripe and paypal",
              style: TextStyle(
                color: Color(0xFF636363),
                fontWeight: FontWeight.w700,
                fontSize: 12,
                fontFamily: AppFonts.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentStatusCard extends StatelessWidget {
  const _PaymentStatusCard({
    required this.title,
    required this.value,
    required this.bottomContent,
    required this.iconPath,
    this.rightPadding = 22,
    this.valueFontSize = 20,
    this.topSpacingBeforeValue = 0,
  });

  final String title;
  final String value;
  final Widget bottomContent;
  final String iconPath;
  final double rightPadding;
  final double valueFontSize;
  final double topSpacingBeforeValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(width: 1, color: Color(0xFFD4D4D4)),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: rightPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: AppFonts.primary,
                      ),
                    ),
                    if (topSpacingBeforeValue > 0)
                      SizedBox(height: topSpacingBeforeValue),
                    Text(
                      value,
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w700,
                        fontSize: valueFontSize,
                        fontFamily: AppFonts.primary,
                      ),
                    ),
                    SizedBox(height: 6),
                    bottomContent,
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE1E1E1),
                ),
                child: Center(child: Image.asset(iconPath)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
