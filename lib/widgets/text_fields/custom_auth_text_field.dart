import 'package:carpool_admin/utils/theme/colors.dart';
import 'package:carpool_admin/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthTextField extends StatefulWidget {
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
    this.suffixIcon,
    this.label,
  });

  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Listen for focus changes to toggle the border color
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
            // Logic: Use active color if focused, otherwise a muted gray
            border: Border.all(
              color: _isFocused ? AppColors.iconActive : const Color(0xFFD1D1D1), 
              width: 1.5,
            ),
          ),
          child: TextFormField(
            focusNode: _focusNode,
            controller: widget.controller,
            obscureText: widget.isPassword,
            keyboardType: widget.keyboardType,
            cursorColor: AppColors.iconActive,
            style: AppTextStyles.authActiveTextField,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyles.authHintTextField,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: InputBorder.none,
              suffixIcon: widget.isPassword 
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: _obscureText 
                      ? widget.suffixIcon ?? const Icon(Icons.visibility_off) 
                      : const Icon(Icons.visibility), // Or your ic_eye.png
                  )
                : widget.suffixIcon,
            ),
          ),
        ),
        // The floating label effect
        if (widget.label != null)
          Positioned(
            left: 12,
            top: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              // Use AppColors.background to match the scaffold behind the field
              color: Colors.white, 
              child: Text(
                widget.label!,
                style: AppTextStyles.labelInput.copyWith(
                  fontSize: 12,
                  // Label turns active color only when field is focused
                  color: _isFocused ? AppColors.iconActive : Colors.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }
}