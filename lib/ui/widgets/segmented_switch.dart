import 'package:flutter/material.dart';

class SegmentItem<T> {
  final T value;
  final String label;

  const SegmentItem({required this.value, required this.label});
}

class SegmentedSwitch<T> extends StatelessWidget {
  final List<SegmentItem<T>> segments;
  final T selected;
  final ValueChanged<T> onSelectionChanged;

  const SegmentedSwitch({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: segments.map((segment) {
        final isSelected = segment.value == selected;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onSelectionChanged(segment.value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            padding: const EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF5D5FEF) // Цвет активного сегмента
                  : Colors.transparent,
              border: isSelected
                  ? Border.all(color: Colors.white24, width: 1)
                  : Border.all(color: Colors.transparent, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  segment.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
