import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const CustomAuthTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon, this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.authContainerColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.iconActive, width: 1.5),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            cursorColor: AppColors.iconActive,
            style: AppTextStyles.authActiveTextField,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.authHintTextField,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        // The floating label effect from your design
        if (label != null)
        Positioned(
          left: 12,
          top: -10,
          child:  Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: const Color(0xFFFFFFFF),
            child: Text(
              label! ,
              style: AppTextStyles.labelInput.copyWith(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}