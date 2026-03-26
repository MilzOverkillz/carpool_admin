import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class ProcessRefundDialog extends StatefulWidget {
  const ProcessRefundDialog({super.key});

  @override
  State<ProcessRefundDialog> createState() => _ProcessRefundDialogState();
}

class _ProcessRefundDialogState extends State<ProcessRefundDialog> {
  final TextEditingController _txnController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _selectedReason;

  final List<String> _reasons = [
    'Ride Cancelled',
    'Driver Issue',
    'Payment Error',
    'Customer Request',
    'Other',
  ];

  @override
  void dispose() {
    _txnController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submit() {
    // Simple validation
    final txn = _txnController.text.trim();
    final amount = _amountController.text.trim();
    final reason = _selectedReason;

    if (txn.isEmpty || amount.isEmpty || reason == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }
    debugPrint('Processing refund: $txn | $amount | $reason');
    Navigator.of(
      context,
    ).pop({'transactionId': txn, 'amount': amount, 'reason': reason});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(38, 57, 38, 47),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SizedBox(
        width: 516,
        height: 469,
        child: Padding(
          padding: const EdgeInsets.only(left: 38,top:  57,right:  38,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Process Refund',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF212B36),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Issues a refund for a completed payment',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9EA2A5),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Transaction ID
              const Text(
                'Transaction ID',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF262626),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _txnController,
                decoration: InputDecoration(
                  hintText: 'TXN -2025-XXX',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Refund Amount',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF262626),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: r'$0.00',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Reason
              const Text(
                'Reason',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF262626),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedReason,
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9A9A9A),
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                ),
                hint: const Text(
                  'Select reason',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9A9A9A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                items: _reasons
                    .map((r) => DropdownMenuItem(
                          value: r,
                          child: Text(
                            r,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9A9A9A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _selectedReason = v),
              ),

              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFA6A6A6)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF495056),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Process Refund',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A regular full-screen page version (non-dialog) of the Process Refund UI.
class ProcessRefundScreen extends StatefulWidget {
  const ProcessRefundScreen({super.key});

  @override
  State<ProcessRefundScreen> createState() => _ProcessRefundScreenState();
}

class _ProcessRefundScreenState extends State<ProcessRefundScreen> {
  final TextEditingController _txnController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _selectedReason;

  final List<String> _reasons = [
    'Ride Cancelled',
    'Driver Issue',
    'Payment Error',
    'Customer Request',
    'Other',
  ];

  @override
  void dispose() {
    _txnController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submit() {
    final txn = _txnController.text.trim();
    final amount = _amountController.text.trim();
    final reason = _selectedReason;

    if (txn.isEmpty || amount.isEmpty || reason == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    debugPrint('Processing refund: $txn | $amount | $reason');
    Navigator.of(
      context,
    ).pop({'transactionId': txn, 'amount': amount, 'reason': reason});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Process Refund'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Issues a refund for a completed payment',
                style: TextStyle(color: Color(0xFF9EA2A5)),
              ),
              const SizedBox(height: 18),

              const Text(
                'Transaction ID',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _txnController,
                decoration: const InputDecoration(
                  hintText: 'TXN -2025-XXX',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Refund Amount',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: r'$0.00',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Reason',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE9E9EA)),
                  borderRadius: BorderRadius.zero,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text('Select reason'),
                    value: _selectedReason,
                    isExpanded: true,
                    items: _reasons
                        .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedReason = v),
                  ),
                ),
              ),

              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFE9E9EA)),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B4F54),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Process Refund'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
