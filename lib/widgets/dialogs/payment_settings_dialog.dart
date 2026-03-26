import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart' show AppFonts;
import 'package:flutter/material.dart';

class PaymentSettingsDialog extends StatefulWidget {
  const PaymentSettingsDialog({super.key});

  @override
  State<PaymentSettingsDialog> createState() => _PaymentSettingsDialogState();
}

class _PaymentSettingsDialogState extends State<PaymentSettingsDialog>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  final List<String> _tabs = const ["Payment Gateway", "Fees & Rules"];
  final TextEditingController _platformFee = TextEditingController(text: '5');
  final TextEditingController _minFare = TextEditingController(text: '5.00');
  final TextEditingController _maxFare = TextEditingController(text: '200.00');

  bool _autoRefund = false;
  bool _manualApproval = false;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!mounted) return;
      try {
        final int idx = _tabController.index;
        setState(() => _selectedTabIndex = idx);
      } catch (_) {
        // ignore any type errors during hot reload or transient states
      }
    });
  }

  @override
  void dispose() {
    _platformFee.dispose();
    _minFare.dispose();
    _maxFare.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _save() {
    final data = {
      'platformFee': _platformFee.text,
      'minFare': _minFare.text,
      'maxFare': _maxFare.text,
      'autoRefund': _autoRefund,
      'manualApproval': _manualApproval,
    };
    Navigator.of(context).pop(data);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFFFFFF),
      insetPadding: const EdgeInsets.fromLTRB(38, 40, 38, 50),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SizedBox(
        width: 560,
        height: 640,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Payment Settings',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF212B36),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Configure payment structure and fee structure',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9EA2A5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 18),

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
                          onTap: () {
                            _tabController.animateTo(index);
                            setState(() => _selectedTabIndex = index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: _selectedTabIndex == index
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
                                    fontWeight: _selectedTabIndex == index
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    fontSize: 12,
                                    fontFamily: AppFonts.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Scrollable content per tab
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Payment Gateway (placeholder cards)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          _gatewayCard(title: 'Stripe', connected: true),
                          const SizedBox(height: 12),
                          _gatewayCard(title: 'PayPal', connected: true),
                          const SizedBox(height: 12),
                          _gatewayCard(title: 'Bank Account', connected: false),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    // Fees & Rules
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Platform Fee (%)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF262626),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _inputField(controller: _platformFee, hint: '5'),
                            const Text(
                              'Fee charged on each ride transaction',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9A9A9A),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Minimum Ride Fare',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF262626),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _inputField(controller: _minFare, hint: r'$5.00'),
                            const SizedBox(height: 20),
                            const Text(
                              'Maximum Ride Fare',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF262626),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _inputField(controller: _maxFare, hint: r'$200.00'),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Auto-refund on cancellation',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF262626),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Automatically refund cancelled rides',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF9A9A9A),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch.adaptive(
                                  value: _autoRefund,
                                  onChanged: (v) =>
                                      setState(() => _autoRefund = v),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Require manual approval for refunds',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF262626),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Admin must approve all refunds',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF9A9A9A),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch.adaptive(
                                  value: _manualApproval,
                                  onChanged: (v) =>
                                      setState(() => _manualApproval = v),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Actions
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFBDBDBD)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF262626),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _save,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0xFF495056),
                      ),
                      child: const Text(
                        'Save Setting',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    String? hint,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF9A9A9A),
        fontWeight: FontWeight.w100,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xFF9A9A9A),
          fontWeight: FontWeight.w100,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
      ),
    );
  }

  Widget _gatewayCard({required String title, required bool connected}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF4F4F5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF262626),
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (connected)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6D5D5),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Connected',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Credits & Debit Cards',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9A9A9A),
                  ),
                ),
                const SizedBox(height: 17),
                if (connected) ...[
                  const Text(
                    'API Key',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF262626),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '****************',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9A9A9A),
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Color(0xFFE6E6E6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBDBDBD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 7,
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Reconnect',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF262626),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF495056),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Connect'),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [Switch.adaptive(value: connected, onChanged: (_) {})],
          ),
        ],
      ),
    );
  }
}
