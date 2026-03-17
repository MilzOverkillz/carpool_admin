import 'package:flutter/material.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/fonts.dart';

class CompanyDropdownFilter extends StatefulWidget {
  final String hint;
  final double width;
  final List<String> items;
  // Added dynamic colors so the Dialog can use Black, while the main screen uses Grey
  final Color textColor;
  final Color iconColor;

  const CompanyDropdownFilter({
    Key? key,
    required this.hint,
    required this.width,
    required this.items,
    this.textColor = const Color(0xFF495056), // Defaults to grey for main screen
    this.iconColor = const Color(0xFF495056), // Defaults to grey for main screen
  }) : super(key: key);

  @override
  State<CompanyDropdownFilter> createState() => _CompanyDropdownFilterState();
}

class _CompanyDropdownFilterState extends State<CompanyDropdownFilter> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.hint; 
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: PopupMenuButton<String>(
        // 1. Forces the dropdown menu to be exactly 200px wide
        constraints: const BoxConstraints(
          minWidth: 200,
          maxWidth: 200,
        ),
        // 2. MATH FIX: Subtracting the menu width (200) from the button width 
        // guarantees the menu perfectly aligns to the RIGHT edge, right under the arrow!
        offset: Offset(widget.width - 200, 48), 
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
                      fontWeight: FontWeight.w500, 
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
          width: widget.width,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.filterBorder, width: 1.0),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.surface,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedValue ?? widget.hint,
                style: TextStyle(
                  fontFamily: AppFonts.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: widget.textColor, // Uses dynamic color
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Image.asset(
                'assets/icons/chevron_down.png',
                width: 12,
                height: 12,
                color: widget.iconColor, // Uses dynamic color (Black for Dialog)
              ),
            ],
          ),
        ),
      ),
    );
  }
}