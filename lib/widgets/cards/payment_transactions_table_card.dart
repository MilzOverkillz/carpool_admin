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
      "dateTime": "24-03-2026 14:30",
    },
    {
      "transactionId": "TXN002",
      "rideId": "RIDE124",
      "user": "Nimal",
      "company": "GemTrans",
      "amount": "\$30",
      "type": "Debit",
      "method": "Cash",
      "status": "Pending",
      "dateTime": "24-03-2026 15:00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Container(
        width: double.infinity,
        height: 380,
        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Column(
          children: [
            PaymentTableRow(),
            SizedBox(height: 22),
            tableHeader(),
            SizedBox(height: 3),
            Divider(height: 0, thickness: 1, color: Color(0xFFF4F4F5)),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return Column(
                    children: [
                      Padding(
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
                            Expanded(
                              child: Text(
                                item["amount"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8.5),
                                decoration: BoxDecoration(
                                  color: Color(0xFFC7C9CB),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(
                                  item["type"]!,
                                  style: AppTextStyles.paymentRow,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item["method"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item["status"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item["dateTime"]!,
                                style: AppTextStyles.paymentRow,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  print(
                                    "View transaction ${item['transactionId']}",
                                  );
                                },
                                child: Center(
                                  child: Image.asset(
                                    "assets/icons/payment/eye.png",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
        Expanded(child: Text("AMOUNT", style: AppTextStyles.paymentHeader)),
        Expanded(child: Text("TYPE", style: AppTextStyles.paymentHeader)),
        Expanded(child: Text("METHOD", style: AppTextStyles.paymentHeader)),
        Expanded(child: Text("STATUS", style: AppTextStyles.paymentHeader)),
        Expanded(
          child: Text("DATE & TIME", style: AppTextStyles.paymentHeader),
        ),
        Expanded(child: Text("ACTION", style: AppTextStyles.paymentHeader)),
      ],
    );
  }
}
