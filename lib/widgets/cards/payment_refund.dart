import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/cards/payment_row.dart';
import 'package:flutter/material.dart';

class PaymentRefund extends StatefulWidget {
  const PaymentRefund({super.key});

  @override
  State<PaymentRefund> createState() => _PaymentRefundState();
}

class _PaymentRefundState extends State<PaymentRefund> {
  final List<Map<String, String>> transactions = [
    {
      "transactionId": "TX-2025-001",
      "rideId": "TX-2025-001",
      "user": "John Smith",
      "amount": "\$24.50",
      "reason": "Ride Cancelled",
      "request": "2025-01-28",
      "status": "Complete",
      "location": "2025-01-28",
    },
    {
      "transactionId": "TX-2025-002",
      "rideId": "TX-2025-002",
      "user": "Courtney Henry",
      "amount": "\$6.48",
      "reason": "Driver Issue",
      "request": "2025-01-28",
      "status": "Approved",
    },
    {
      "transactionId": "TX-2025-003",
      "rideId": "TX-2025-003",
      "user": "Cody Fisher",
      "amount": "\$14.81",
      "reason": "Payment Error",
      "request": "2025-01-28",
      "status": "Approved",
    },
    {
      "transactionId": "TX-2025-004",
      "rideId": "TX-2025-004",
      "user": "Leslie Alexander",
      "amount": "\$17.84",
      "reason": "Ride Cancelled",
      "request": "2025-01-28",
      "status": "Pending",
    },
    {
      "transactionId": "TX-2025-005",
      "rideId": "TX-2025-005",
      "user": "Esther Howard",
      "amount": "\$5.22",
      "reason": "Ride Cancelled",
      "request": "2025-01-28",
      "status": "Approved",
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
          children: [
            const PaymentTableRow(),
            const SizedBox(height: 22),
            tableHeader(),
            const SizedBox(height: 3),
            const Divider(height: 0, thickness: 1, color: Color(0xFFF4F4F5)),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final item = transactions[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item["transactionId"] ?? "",
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item["rideId"] ?? "",
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item["user"] ?? "",
                            style: AppTextStyles.paymentRow,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Center(
                            child: Text(
                              item["amount"] ?? "",
                              style: AppTextStyles.paymentRow,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              item["reason"] ?? "",
                              style: AppTextStyles.paymentRow,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              item["request"] ?? "",
                              style: AppTextStyles.paymentRow,
                            ),
                          ),
                        ),

                        // STATUS
                        Expanded(
                          child: Center(
                            child: Container(
                              width: 74,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0xFFC7C9CB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  item["status"] ?? "",
                                  style: AppTextStyles.paymentRow3,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                print(
                                  "View transaction ${item['transactionId']}",
                                );
                              },
                              child: Image.asset(
                                "assets/icons/payment/eye.png",
                              ),
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
    return Row(
      children: [
        Expanded(
          child: Text("TRANSACTION ID", style: AppTextStyles.paymentHeader2),
        ),

        Expanded(child: Text("RIDE ID", style: AppTextStyles.paymentHeader)),

        Expanded(child: Text("USER", style: AppTextStyles.paymentHeader)),

        SizedBox(
          width: 120,
          child: Center(
            child: Text("AMOUNT", style: AppTextStyles.paymentHeader),
          ),
        ),
        Expanded(
          child: Center(
            child: Text("REASON", style: AppTextStyles.paymentHeader),
          ),
        ),

        Expanded(
          child: Center(
            child: Text("REQUEST", style: AppTextStyles.paymentHeader),
          ),
        ),

        Expanded(
          child: Center(
            child: Text("STATUS", style: AppTextStyles.paymentHeader),
          ),
        ),

        Expanded(
          child: Center(
            child: Text("ACTION", style: AppTextStyles.paymentHeader),
          ),
        ),
      ],
    );
  }
}
