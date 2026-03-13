import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool first;
  final bool last;

  const OtpInputField({
    super.key,
    required this.controller,
    this.first = false,
    this.last = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99.5, 
      height: 64,  
      decoration: BoxDecoration(
    // ignore: deprecated_member_use
    color: const Color(0xFFB2B3B5).withOpacity(0.20), 
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        // ignore: deprecated_member_use
        color: const Color(0xFF101828).withOpacity(0.05),
        offset: const Offset(0, 1), 
        blurRadius: 2,             
        spreadRadius: 0,           
      ),
    ],
  ),
      child: Container(
        padding: EdgeInsets.only(top: 8),
        width: 67.5,
        height: 30,
        child: TextField(
        controller: controller,
        autofocus: first,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
          fontFamily: AppFonts.primary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
      )
    );
  }
}