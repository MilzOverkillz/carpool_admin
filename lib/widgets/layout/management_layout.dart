import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ManagementLayout extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? actionButtonText;
  final IconData? actionButtonIcon;
  final VoidCallback? onActionPressed;
  
  // Toolbar
  final String searchHint;
  final TextEditingController? searchController;
  final Widget? trailingToolbarWidget; // For the "All Status" dropdown
  
  // Table Content
  final Widget headerRow; // Pass a Row with Expanded widgets for custom flex
  final List<Widget> items; // Pass your custom row widgets here

  const ManagementLayout({
    super.key,
    this.title,
    this.subtitle,
    this.actionButtonText,
    this.actionButtonIcon,
    this.onActionPressed,
    this.searchHint = "Search",
    this.searchController,
    this.trailingToolbarWidget,
    required this.headerRow,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- HEADER SECTION ---
        if (title != null || actionButtonText != null)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (title != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style:  TextStyle(
                          fontFamily: AppFonts.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF212b36), // Dark text
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          style: TextStyle(
                          fontFamily: AppFonts.dmSans,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.02,
                          color: Color(0xffa3aed0), // Dark text
                        ),
                        ),
                      ]
                    ],
                  ),
                if (actionButtonText != null)
                  GestureDetector(
                    onTap: onActionPressed ?? () {},
                    child: Container(
                      width: 204,
                      height: 37,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xff495056)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(actionButtonText!, style: TextStyle(fontFamily: AppFonts.primary, fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.white),),
                          SizedBox(width: 10,),
                          SvgPicture.asset('assets/icons/add.svg')
                        ],
                      )
                    ),
                  ),
              ],
            ),
          ),
        
        const SizedBox(height: 24),

        // --- TABLE CONTAINER ---
        Container(
          padding: EdgeInsets.symmetric(vertical: 26, horizontal: 19),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: const Offset(0, -3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  // Search Bar
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: 469,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: searchHint,
                          hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
                          prefixIconConstraints: const BoxConstraints(
    minWidth: 40, // Gives the icon some breathing room from the left edge
    minHeight: 40,
  ),
  prefixIcon: SvgPicture.asset(
    'assets/icons/ic_search.svg',
    width: 16,
    height: 16,
    fit: BoxFit.scaleDown, // 2. Forces the SVG to shrink to your exact 16x16 size
  ),

  // Same logic for the suffix icon
  suffixIconConstraints: const BoxConstraints(
    minWidth: 40,
    minHeight: 40,
  ),
  suffixIcon: SvgPicture.asset(
    'assets/icons/ic_sliders.svg',
    width: 16,
    height: 16,
    fit: BoxFit.scaleDown,
  ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10), // Center text
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 3), // Pushes dropdown to the right
                  
                  // Custom Trailing Widget (e.g., Dropdown)
                  ?trailingToolbarWidget
                ],
              ),
              SizedBox(height: 19,),
              // TABLE HEADER
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                ),
                child: headerRow,
              ),

              // TABLE BODY (List of items)
              ListView.separated(
                shrinkWrap: true, // Important if this is inside a ScrollView
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFF1F5F9)),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: items[index],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}