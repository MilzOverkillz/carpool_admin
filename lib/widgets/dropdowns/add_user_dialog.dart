import 'package:flutter/material.dart';
import '../../utils/theme/fonts.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 518, // EXACT width from Figma
        padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 32), 
        child: SingleChildScrollView( 
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Header Row ---
              SizedBox(
                width: 414, // Exact width of inner content
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Company Managment',
                          style: TextStyle(
                            fontFamily: AppFonts.primary, 
                            fontSize: 18,
                            fontWeight: FontWeight.w700, 
                            color: Color(0xFF212B36),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Create an new company account',
                          style: TextStyle(
                            fontFamily: 'DMSans', 
                            fontSize: 12,
                            fontWeight: FontWeight.w400, 
                            color: Color(0xFF9EA2A5),
                            letterSpacing: -0.24, 
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(), 
                      child: const Icon(Icons.close, color: Colors.black, size: 20), 
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // --- Input Fields ---
              _buildInputField('Full Name', 'Enter fullname'),
              const SizedBox(height: 16),
              _buildInputField('Email', 'user@company.com'),
              const SizedBox(height: 16),
              _buildInputField('Phone', '+94 2746 2728'),
              const SizedBox(height: 16),
              
              // --- Custom Dialog Dropdowns ---
              _DialogDropdownField(
                label: 'Company', 
                hint: 'Select company', 
                items: const ['Tech corp Inc', 'Design Studio Ltd', 'Finance solutions', 'Healthcare Pvt', 'Retail Group'],
              ),
              const SizedBox(height: 16),
              _DialogDropdownField(
                label: 'Role', 
                hint: 'Select role', 
                items: const ['Company Admin', 'Admin', 'Driver', 'Rider', 'Driver & Rider'],
              ),
              
              const SizedBox(height: 32), 
              
              // --- Action Buttons ---
              SizedBox(
                width: 414,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildCancelButton(context),
                    const SizedBox(width: 12),
                    _buildAddUserButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for Input Fields
  Widget _buildInputField(String label, String hint) {
    return SizedBox(
      width: 414,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppFonts.primary,
              fontSize: 12,
              fontWeight: FontWeight.w500, 
              color: Color(0xFF262626),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 43, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), 
              border: Border.all(color: const Color(0xFFD9D9D9), width: 1.0), 
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w400, 
                  color: Color(0xFF9A9A9A), 
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                isDense: true,
              ),
              style: const TextStyle(
                fontFamily: AppFonts.primary,
                fontSize: 12,
                color: Color(0xFF262626),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Cancel Button
  Widget _buildCancelButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFD9D9D9), width: 1.0),
        ),
        child: const Text(
          'Cancel',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600, 
            color: Color(0xFF000000), 
          ),
        ),
      ),
    );
  }

  // Helper for Add User Button
  Widget _buildAddUserButton() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF4B5563), 
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Add User',
          style: TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600, 
            color: Color(0xFFFFFFFF), 
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// STANDALONE DROPDOWN WIDGET STRICTLY FOR THE DIALOG
// ============================================================================
class _DialogDropdownField extends StatefulWidget {
  final String label;
  final String hint;
  final List<String> items;

  const _DialogDropdownField({
    required this.label,
    required this.hint,
    required this.items,
  });

  @override
  State<_DialogDropdownField> createState() => _DialogDropdownFieldState();
}

class _DialogDropdownFieldState extends State<_DialogDropdownField> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    bool hasValue = _selectedValue != null;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: AppFonts.primary,
            fontSize: 12,
            fontWeight: FontWeight.w500, 
            color: Color(0xFF262626),
          ),
        ),
        const SizedBox(height: 8),
        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: PopupMenuButton<String>(
            constraints: const BoxConstraints(
              minWidth: 200,
              maxWidth: 200,
            ),
            offset: const Offset(214, 48), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), 
            ),
            color: Colors.white,
            elevation: 8, 
            onSelected: (String value) {
              setState(() {
                _selectedValue = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return widget.items.map((String item) {
                bool isSelected = _selectedValue == item;
                
                return PopupMenuItem<String>(
                  value: item,
                  height: 38, 
                  padding: const EdgeInsets.symmetric(horizontal: 16), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                          fontFamily: AppFonts.primary, 
                          fontSize: 12, 
                          fontWeight: FontWeight.w400, 
                          color: isSelected ? const Color(0xFF495056) : const Color(0xFF000000), 
                        ),
                      ),
                      if (isSelected)
                        Image.asset(
                          'assets/icons/check.png', 
                          width: 12,
                          height: 12,
                          color: const Color(0xFF495056), 
                        ),
                    ],
                  ),
                );
              }).toList();
            },
            child: Container(
              width: 414, 
              height: 43, 
              padding: const EdgeInsets.only(left: 16, right: 12), // Adjusted right padding slightly to accommodate the 24px icon perfectly
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFD9D9D9), width: 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedValue ?? widget.hint,
                    style: TextStyle(
                      fontFamily: AppFonts.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400, 
                      color: hasValue ? const Color(0xFF262626) : const Color(0xFF9A9A9A), 
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  // UPDATED: Now 24x24 with dummy name
                  Image.asset(
                    'assets/icons/Expand_down.png', // Replace with your actual icon file name
                    width: 24,
                    height: 24,
                    color: const Color(0xFF262626), // Retained the dark color from the design specs
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}