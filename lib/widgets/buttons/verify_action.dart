import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class AuthActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSolid; 
  final double width;
  final double height;

  const AuthActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSolid = true,
    this.width = 215,
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          // Background logic
          backgroundColor: isSolid ? Colors.black : AppColors.authContainerColor,
          side: isSolid 
              ? BorderSide.none 
              : const BorderSide(color: Color(0xFFa6a6a6), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSolid ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.primary,
          ),
        ),
      ),
    );
  }
}