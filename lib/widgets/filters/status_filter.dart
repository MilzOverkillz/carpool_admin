import 'package:flutter/material.dart';

class StatusFilterDropdown extends StatefulWidget {
  final List<String> options;
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const StatusFilterDropdown({
    super.key,
    this.options = const ["All Status", "Active", "Inactive", "Pending Approval"],
    this.initialValue = "All Status",
    this.onChanged,
  });

  @override
  State<StatusFilterDropdown> createState() => _StatusFilterDropdownState();
}

class _StatusFilterDropdownState extends State<StatusFilterDropdown> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMenu(context),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _selected,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF64748B)),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final String? result = await showMenu<String>(
      context: context,
      position: position,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      items: widget.options.map((String value) {
        final bool isSelected = value == _selected;
        return PopupMenuItem<String>(
          value: value,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF1E293B),
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
              if (isSelected)
                const Icon(Icons.check, size: 16, color: Color(0xFF1E293B)),
            ],
          ),
        );
      }).toList(),
    );

    if (result != null) {
      setState(() => _selected = result);
      widget.onChanged?.call(result);
    }
  }
}