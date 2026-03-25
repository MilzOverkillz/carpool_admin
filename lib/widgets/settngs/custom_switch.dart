import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.black,
    this.inactiveColor = const Color(0xFFBDC3C7),
    this.width = 32.0,
    this.height = 21.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: value ? activeColor : inactiveColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: height - 4,
              height: height - 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
