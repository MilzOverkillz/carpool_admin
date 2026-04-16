import 'package:flutter/material.dart';
import '../../utils/theme/text_styles.dart';

class PaymentRowWidget extends StatelessWidget {
  final String transactionId;
  final String rideId;
  final String user;
  final String company;
  final String amount;
  final String type;
  final String method;
  final String status;
  final String dateTime;
  final VoidCallback? onView;

  const PaymentRowWidget({
    super.key,
    required this.transactionId,
    required this.rideId,
    required this.user,
    required this.company,
    required this.amount,
    required this.type,
    required this.method,
    required this.status,
    required this.dateTime,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        children: [
          _cell(transactionId, flex: 4),
          _cell(rideId, flex: 4),
          _cell(user, flex: 3),
          _cell(company, flex: 4),
          _cell(amount, flex: 2),

          /// TYPE
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(type),
            ),
          ),

          _cell(method, flex: 4),

          /// STATUS
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildPill(status),
            ),
          ),

          _cell(dateTime, flex: 4),

          /// ACTION
          Expanded(
            flex: 2,
            child: Center(
              child: InkWell(
                onTap: onView,
                child: Image.asset(
                  "assets/icons/payment/eye.png",
                  width: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 TEXT CELL
  Widget _cell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTextStyles.paymentRow,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 🔹 COMMON PILL (TYPE + STATUS)
  Widget _buildPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 22,
      decoration: BoxDecoration(
        color: const Color(0xFFC7C9CB),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTextStyles.paymentRow,
      ),
    );
  }
}