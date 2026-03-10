import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AuthBackButton({
    super.key, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          context.pop(); 
        }
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(color: AppColors.backButtonColor, borderRadius: BorderRadius.circular(10)),
        child: Icon(Icons.arrow_back, color: AppColors.backButtonArrowColor,weight: 12,),
      ),
    );

  }
}