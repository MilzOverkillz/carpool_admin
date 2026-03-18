import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const double _tableBaseWidth = 915;

class PaymentTransactionsTableCard extends StatefulWidget {
  const PaymentTransactionsTableCard({super.key});

  @override
  State<PaymentTransactionsTableCard> createState() =>
      _PaymentTransactionsTableCardState();
}

class _PaymentTransactionsTableCardState
    extends State<PaymentTransactionsTableCard> {
  String _selectedType = 'All Types';
  String _selectedStatus = 'All Status';
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _tableVerticalScrollController = ScrollController();
  String _searchQuery = '';

  static const List<_PaymentRowData> _rows = [
    _PaymentRowData(
      transactionId: 'TX-2025-001',
      rideId: 'TX-2025-001',
      user: 'John Smith',
      company: 'Tech Corp Inc',
      amount: '\$24.50',
      type: 'Payment',
      method: 'Company Account',
      status: 'Completed',
      dateAndTime: '2025-01-28 8:00 AM',
    ),
    _PaymentRowData(
      transactionId: 'TX-2025-002',
      rideId: 'TX-2025-002',
      user: 'Devon Lane',
      company: 'Health Care Plus',
      amount: '\$24.50',
      type: 'Refund',
      method: 'Credit Card',
      status: 'Pending',
      dateAndTime: '2025-01-28 8:00 AM',
    ),
    _PaymentRowData(
      transactionId: 'TX-2025-003',
      rideId: 'TX-2025-003',
      user: 'Ariane McCoy',
      company: 'Finance Solution',
      amount: '\$24.50',
      type: 'Refund',
      method: 'Digital Wallet',
      status: 'Failed',
      dateAndTime: '2025-01-28 8:00 AM',
    ),
    _PaymentRowData(
      transactionId: 'TX-2025-004',
      rideId: 'TX-2025-004',
      user: 'Jane Cooper',
      company: 'Retail Group',
      amount: '\$24.50',
      type: 'Payment',
      method: 'Credit Card',
      status: 'Completed',
      dateAndTime: '2025-01-28 8:00 AM',
    ),
  ];

  List<_PaymentRowData> get _filteredRows {
    final String search = _searchQuery.trim().toLowerCase();

    return _rows.where((row) {
      final bool typeMatches =
        _selectedType == 'All Types' || row.type == _selectedType;
      final bool statusMatches =
          _selectedStatus == 'All Status' || row.status == _selectedStatus;
      final bool searchMatches =
          search.isEmpty ||
          row.transactionId.toLowerCase().contains(search) ||
          row.rideId.toLowerCase().contains(search) ||
          row.user.toLowerCase().contains(search) ||
          row.company.toLowerCase().contains(search) ||
          row.amount.toLowerCase().contains(search) ||
          row.type.toLowerCase().contains(search) ||
          row.method.toLowerCase().contains(search) ||
          row.status.toLowerCase().contains(search) ||
          row.dateAndTime.toLowerCase().contains(search);

      return typeMatches && statusMatches && searchMatches;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tableVerticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 37),
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 13,
            spreadRadius: -3,
            color: Color(0xFF000000).withOpacity(0.2)
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(width: 1, color: const Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 469,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFFFFFF),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Image.asset('assets/icons/payment/search.png'),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() => _searchQuery = value);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Color(0xFF1D1929),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: AppFonts.primary,
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                          style: const TextStyle(
                            color: Color(0xFF1D1929),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: AppFonts.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Image.asset('assets/icons/payment/sliders.png'),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      _TypeDropdown(
                        value: _selectedType,
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() => _selectedType = value);
                        },
                      ),
                      const SizedBox(width: 10),
                      _StatusDropdown(
                        value: _selectedStatus,
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() => _selectedStatus = value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double tableWidth = math.max(
                    constraints.maxWidth,
                    _tableBaseWidth,
                  );

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: tableWidth,
                      child: Column(
                        children: [
                          _TableHeaderRow(tableWidth: tableWidth),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Scrollbar(
                              controller: _tableVerticalScrollController,
                              child: ListView.separated(
                                controller: _tableVerticalScrollController,
                                primary: false,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: _filteredRows.length,
                                separatorBuilder: (_, __) => const Divider(
                                  height: 1,
                                  color: Color(0xFFF1F5F9),
                                ),
                                itemBuilder: (context, index) {
                                  return _TableDataRow(
                                    row: _filteredRows[index],
                                    tableWidth: tableWidth,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
}

class _TypeDropdown extends StatelessWidget {
  const _TypeDropdown({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: PopupMenuButton<String>(
        tooltip: '',
        position: PopupMenuPosition.under,
        color: Colors.white,
        elevation: 4,
        constraints: const BoxConstraints(minWidth: 120),
        offset: const Offset(0, 4),
        onSelected: (selectedValue) => onChanged(selectedValue),
        itemBuilder: (context) => const [
          PopupMenuItem(
            value: 'All Types',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('All Types'),
          ),
          PopupMenuItem(
            value: 'Payment',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('Payment'),
          ),
          PopupMenuItem(
            value: 'Refund',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('Refund'),
          ),
        ],
        child: Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF1D1929),
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: AppFonts.primary,
              ),
            ),
            const SizedBox(width: 6),
            Image.asset(
              'assets/icons/payment/arrowDown.png',
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusDropdown extends StatelessWidget {
  const _StatusDropdown({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: PopupMenuButton<String>(
        tooltip: '',
        position: PopupMenuPosition.under,
        color: Colors.white,
        elevation: 4,
        constraints: const BoxConstraints(minWidth: 140),
        offset: const Offset(0, 4),
        onSelected: (selectedValue) => onChanged(selectedValue),
        itemBuilder: (context) => const [
          PopupMenuItem(
            value: 'All Status',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('All Status'),
          ),
          PopupMenuItem(
            value: 'Failed',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('Failed'),
          ),
          PopupMenuItem(
            value: 'Completed',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('Completed'),
          ),
          PopupMenuItem(
            value: 'Pending',
            padding: EdgeInsets.only(left: 24, right: 12),
            child: Text('Pending'),
          ),
        ],
        child: Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF1D1929),
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: AppFonts.primary,
              ),
            ),
            const SizedBox(width: 6),
            Image.asset(
              'assets/icons/payment/arrowDown.png',
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _TableHeaderRow extends StatelessWidget {
  const _TableHeaderRow({required this.tableWidth});

  final double tableWidth;

  @override
  Widget build(BuildContext context) {
    final double scale = tableWidth / _tableBaseWidth;

    return Row(
      children: [
        _HeaderCell(title: 'TRANSACTION ID', width: 90 * scale, fontSize: 12),
        _HeaderCell(title: 'RIDE ID', width: 90 * scale),
        _HeaderCell(title: 'USER', width: 95 * scale),
        _HeaderCell(title: 'COMPANY', width: 105 * scale),
        _HeaderCell(title: 'AMOUNT', width: 70 * scale),
        _HeaderCell(title: 'TYPE', width: 100 * scale),
        _HeaderCell(title: 'METHOD', width: 105 * scale),
        _HeaderCell(title: 'STATUS', width: 100 * scale),
        _HeaderCell(title: 'DATA & TIME', width: 105 * scale),
        _HeaderCell(title: 'ACTION', width: 55 * scale),
      ],
    );
  }
}

class _TableDataRow extends StatelessWidget {
  const _TableDataRow({required this.row, required this.tableWidth});

  final _PaymentRowData row;
  final double tableWidth;

  @override
  Widget build(BuildContext context) {
    final double scale = tableWidth / _tableBaseWidth;

    return SizedBox(
      height: 42,
      child: Row(
        children: [
          _BodyCell(text: row.transactionId, width: 90 * scale),
          _BodyCell(text: row.rideId, width: 90 * scale),
          _BodyCell(text: row.user, width: 95 * scale),
          _BodyCell(text: row.company, width: 105 * scale),
          _BodyCell(text: row.amount, width: 70 * scale),
          _BodyCell(
            width: 100 * scale,
            child: _Tag(
              text: row.type,
              backgroundColor: const Color(0xFFC7C9CB),
            ),
          ),
          _BodyCell(text: row.method, width: 105 * scale),
          _BodyCell(
            width: 100 * scale,
            alignment: Alignment.centerLeft,
            child: _Tag(
              text: row.status,
              backgroundColor: const Color(0xFFC7C9CB),
            ),
          ),
          _BodyCell(text: row.dateAndTime, width: 105 * scale),
          SizedBox(
            width: 55 * scale,
            child: Center(
              child: Icon(
                Icons.remove_red_eye_outlined,
                size: 16,
                color: Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell({
    required this.title,
    required this.width,
    this.fontSize = 14,
  });

  final String title;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9EA2A5),
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            fontFamily: AppFonts.primary,
          ),
        ),
      ),
    );
  }
}

class _BodyCell extends StatelessWidget {
  const _BodyCell({
    this.text,
    required this.width,
    this.child,
    this.alignment = Alignment.centerLeft,
  });

  final String? text;
  final double width;
  final Widget? child;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: alignment,
        child:
            child ??
            Text(
              text ?? '',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color(0xFF1E272E),
                fontWeight: FontWeight.w700,
                fontSize: 12,
                fontFamily: AppFonts.primary,
              ),
            ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({
    required this.text,
    required this.backgroundColor,
  });

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: backgroundColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF1E272E),
          fontWeight: FontWeight.w400,
          fontSize: 10,
          fontFamily: AppFonts.primary,
        ),
      ),
    );
  }
}

class _PaymentRowData {
  const _PaymentRowData({
    required this.transactionId,
    required this.rideId,
    required this.user,
    required this.company,
    required this.amount,
    required this.type,
    required this.method,
    required this.status,
    required this.dateAndTime,
  });

  final String transactionId;
  final String rideId;
  final String user;
  final String company;
  final String amount;
  final String type;
  final String method;
  final String status;
  final String dateAndTime;
}
