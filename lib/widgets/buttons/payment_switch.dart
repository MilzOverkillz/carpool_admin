import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Color activeColor;
  final Color inactiveColor;
  final Function(bool) onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    this.activeColor = Colors.lightGreen,
    this.inactiveColor = Colors.grey,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
        print(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 32,
        height: 21,
        padding: const EdgeInsets.all(1.5),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: value ? activeColor: inactiveColor,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              left: value ? 14 : 0,
              top: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
