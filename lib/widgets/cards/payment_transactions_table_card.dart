import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:carpool_admin/widgets/cards/payment_row.dart';
import 'package:flutter/material.dart';

class PaymentTransactionsTableCard extends StatefulWidget {
  const PaymentTransactionsTableCard({super.key});

  @override
  State<PaymentTransactionsTableCard> createState() =>
      _PaymentTransactionsTableCardState();
}

class _PaymentTransactionsTableCardState
    extends State<PaymentTransactionsTableCard> {
  final List<Map<String, String>> transactions = [
    {
      "transactionId": "TX-2025-001",
      "rideId": "TX-2025-001",
      "user": "John Smith",
      "company": "Tech Corp Inc",
      "amount": "\$24.50",
      "type": "Payment",
      "method": "Company Account",
      "status": "Completed",
      "date": "2025-01-28",
      "time": "8.00 AM",
    },
    {
      "transactionId": "TX-2025-002",
      "rideId": "TX-2025-002",
      "user": "Devon Lane",
      "company": "Health Care Plus",
      "amount": "\$24.50",
      "type": "Refund",
      "method": "Credit Card",
      "status": "Pending",
      "date": "2025-01-28",
      "time": "8.00 AM",
    },
    {
      "transactionId": "TX-2025-003",
      "rideId": "TX-2025-003",
      "user": "Arlene McCoy",
      "company": "Finance Solution",
      "amount": "\$24.50",
      "type": "Refund",
      "method": "Digital Wallet",
      "status": "Failed",
      "date": "2025-01-28",
      "time": "8.00 AM",
    },
    {
      "transactionId": "TX-2025-004",
      "rideId": "TX-2025-004",
      "user": "Jane Cooper",
      "company": "Retail Group",
      "amount": "\$24.50",
      "type": "Payment",
      "method": "Credit Card",
      "status": "Completed",
      "date": "2025-01-28",
      "time": "8.00 AM",
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
                            item["transactionId"]!,
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item["rideId"]!,
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item["user"]!,
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item["company"]!,
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        SizedBox(
                          width: 70,
                          child: Text(
                            item["amount"] ?? "",
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        // TYPE
                        Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC7C9CB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                item["type"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            item["method"]!,
                            style: AppTextStyles.paymentRow,
                          ),
                        ),

                        // STATUS
                        Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFC7C9CB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                item["status"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["date"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                              Text(
                                item["time"]!,
                                style: AppTextStyles.paymentRow2,
                              ),
                            ],
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

        Expanded(child: Text("COMPANY", style: AppTextStyles.paymentHeader)),

        SizedBox(
          width: 70, 
          child: Text("AMOUNT", style: AppTextStyles.paymentHeader),
        ),
        Expanded(
          child: Center(
            child: Text("TYPE", style: AppTextStyles.paymentHeader),
          ),
        ),

        Expanded(child: Text("METHOD", style: AppTextStyles.paymentHeader)),

        Expanded(
          child: Center(
            child: Text("STATUS", style: AppTextStyles.paymentHeader),
          ),
        ),

        SizedBox(
          width: 120,
          child: Text("DATE & TIME", style: AppTextStyles.paymentHeader),
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
