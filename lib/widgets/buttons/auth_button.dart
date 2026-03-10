import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const AuthButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 9.4,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (onTap != null) {
            onTap!();
          } else {
            context.pop();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark, // #000000
          foregroundColor: AppColors.textInverse, // #FFFFFF
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: AppTextStyles.labelButton.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}