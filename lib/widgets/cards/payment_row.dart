import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class PaymentTableRow extends StatefulWidget {
  const PaymentTableRow({super.key});

  @override
  State<PaymentTableRow> createState() => _PaymentTableRowState();
}

class _PaymentTableRowState extends State<PaymentTableRow> {
  String? selectedStatus = 'AllStatus';
  String? selectedType = 'Completed';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, top: 26, right: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 469,
            height: 47,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1, color: Color(0xFFE9E9EA)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Image.asset("assets/icons/payment/search.png"),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Image.asset("assets/icons/payment/sliders.png"),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Color(0xFF1D1929),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: AppFonts.primary,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 132,
                height: 46,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFE9E9EA)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedStatus,
                        hint: Text(
                          "AllStatus",
                          style: TextStyle(
                            color: Color(0xFF1D1929),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xFF1D1929),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: AppFonts.primary,
                        ),
                        isExpanded: true,
                        isDense: true,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/icons/payment/arrowDown.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        items: <String>['AllStatus', 'Pending', 'Completed']
                            .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedStatus = val!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 24),
              SizedBox(
                width: 106,
                height: 46,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFFE9E9EA)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedType,
                        hint: Text(
                          "Completed",
                          style: TextStyle(
                            color: Color(0xFF1D1929),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xFF1D1929),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: AppFonts.primary,
                        ),
                        isExpanded: true,
                        isDense: true,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Image.asset(
                            'assets/icons/payment/arrowDown.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        items: <String>['Completed', 'Failed', 'Pending'].map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedType = val!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
