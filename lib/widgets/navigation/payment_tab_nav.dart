import 'package:flutter/material.dart';
import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';

class PaymentTabNav extends StatelessWidget {
  final List<String> tabs;
  final List<int?>? tabCounts;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const PaymentTabNav({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
    this.tabCounts,
  });

  @override
  Widget build(BuildContext context) {
    final counts = tabCounts ?? List<int?>.filled(tabs.length, null);

    return Container(
      width: double.infinity,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.tabsSelection,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Row(
          children: List.generate(
            tabs.length,
            (index) => Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: selectedIndex == index ? AppColors.surface : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tabs[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: selectedIndex == index ? FontWeight.w700 : FontWeight.w600,
                          fontSize: 12,
                          fontFamily: AppFonts.primary,
                        ),
                      ),
                      if (counts.length > index && counts[index] != null) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            counts[index].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
