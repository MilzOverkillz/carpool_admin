import 'package:carpool_admin/utils/theme/fonts.dart';
import 'package:flutter/material.dart';

class ToggleStatusItem extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Function(bool)? onChanged;

  const ToggleStatusItem({
    super.key,
    required this.label,
    this.initialValue = true,
    this.onChanged,
  });

  @override
  State<ToggleStatusItem> createState() => _ToggleStatusItemState();
}

class _ToggleStatusItemState extends State<ToggleStatusItem> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _handleTap() {
    setState(() {
      _isChecked = !_isChecked;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_isChecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque, // Ensures the whole row is clickable
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The Checkbox Icon Container
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(6),
              ),
              child: _isChecked
                  ? const Icon(Icons.check, size: 12, color: Colors.black54)
                  : null,
            ),
            const SizedBox(width: 12),
            // The Text Label
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontFamily: AppFonts.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
